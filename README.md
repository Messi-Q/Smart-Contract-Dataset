# Smart contract vulnerability dataset

**This repository releases the official datasets for five types of smart contract vulnerabilities, and gives the instructions for how to label the these vulnerability datasets.**



## Timestamp Dependence
Block timestamp dependence is considered as using _block.timestamp_ (or _block.number_) as part of the conditions to perform critical operations.


### How to label the timestamp dependency vulnerability?
We design three local patterns to label the timestamp dependence vulnerability dataset. The first pattern **timestampInvoc** models 
whether there exists an invocation to _block.timestamp_ in the function. The second pattern **timestampAssign** checks 
whether the value of _block.timestamp_ is assigned to other variables or passed to a condition statement as a parameter, 
namely whether _block.timestamp_ is actually used. Last, the third pattern **timestampContaminate** checks 
if _block.timestamp_ may contaminate the triggering condition of a critical operation (e.g., money transfer) or the return value.


### TimestampInvoc

Note that we treat those functions with the key word of _block.timestamp_ as the research targets. As such, we utilize the pattern **timestampInvoc** to filter those functions without the key word of _block.timestamp_. 


### TimestampAssign 

Case 1：When the value of _block.timestamp_ is assigned to a variable and the variable is used by the following operations or 
passed to a condition statement as a parameter, we label the corresponding function exists the timestamp dependency vulnerability.
    
    ```    
        1.contract CrowdsaleWPTByRounds{
        2.    uint256 public closingTime;       
        3.    function closeRound() public returns(uint256) {
        4.        closingTime = block.timestamp + 1;
        5.        return closingTime;
        6.    }
        7.}
    ```
 
For instance, the value of _block.timestamp_ is assigned to variable _closingTime_  (line 4), while the variable _closingTime_
is called in the return statement (line 5). Therefore, we mark that the function _closeRound_ exists the 
timestamp dependency vulnerability, i.e., label = 1.


Case 2: When the value of _block.timestamp_ is called by the condition statements (e.g., _require_ and _assert_), we consider 
that the _block.timestamp_ is constricted by the condition statements, we label the corresponding function does not exist 
the timestamp dependency vulnerability.

    ```    
        1.contract Safe {
        2.    address public owner;
        3.    uint256 public lock;        
        4.    function withdrawal( address to, uint value) returns (bool) {
        5.        require(msg.sender == owner);
        6.        uint256 time = block.timestamp;
        7.        require(time >= lock);
        8.        require(to != address(0));
        9.        return true;
        10.    }
        11.}
    ```
    
For instance, the value of _block.timestamp_ is assigned to variable _time_  (line 6), while the variable _time_
is called in the require statement (line 7). Therefore, we mark that the function _withdrawal_ does not exist the 
timestamp dependency vulnerability, i.e., label = 0.


### TimestampContaminate

case 1：当条件语句的控制内容涉及函数的返回值，此时，认定该合约存在时间戳依赖漏洞(标签为1)。

    ```
        1.contract CrowdsaleExt {
        2.    uint public startsAt;
        3.    uint public endsAt;
        4.    bool public finalized;
        5.    enum State {PreFunding, Failure, Finalized}
        6.    function getState() public constant returns (State) {
        7.         if(finalized) return State.Finalized;
        8.         else if (block.timestamp < startsAt) return State.PreFunding;
        9.         else return State.Failure;
        10.   }
        11.}
     ``` 
       
以上述合约第8行为例，当条件语句else if满足(block.timestamp < startsAt)时，函数getState返回值为State.PreFunding；
显然，该合约符合对于情形1的定义，则认为该合约CrowdsaleExt存在时间戳依赖漏洞（标签为1）。

Case 2：当条件语句的控制内容涉及转账等与资金相关的操作，此时，认定该合约存在时间戳依赖漏洞（标签为1）。
    
    ```
        1.contract FreezableToken {
        2.    function releaseAll() public returns (uint tokens) {
        3.         uint release;
        4.         uint balance;
        5.         while (release != 0 && block.timestamp > release) {
        6.                tokens += balance;
        7.                msg.sender.call.value(tokens);
        8.         }
        9.         return tokens;
        10.   }
        11.}
    ```
    
以上述合约第5行为例，当条件语句while满足(release != 0 && block.timestamp > release)时，该合约执行call.value转账操作；
显然，该合约符合对于情形2的定义，则认为该合约FreezableToken存在时间戳依赖漏洞（标签为1）。

Case 3：当条件语句的控制内容与函数返回值和转账等资金操作无关，此时，认定该合约不存在时间戳依赖漏洞（标签为0）。
    
    ```
        1.contract BirthdayGift {
        2.    address public recipient;
        3.    uint public birthday;
        4.    function Take () {
        5         if (msg.sender != recipient) throw;
        6.        if (block.timestamp < birthday) throw;
        7.        if (!recipient.send (this.balance)) throw;
        8.        return;
        9.    }
        10.}
    ```
    
以上述合约第6行为例，当条件语句if满足（block.timestamp < birthday）时，函数Take抛出异常；
显然，该合约符合对于情形3的定义，则认为该合约BirthdayGift不存在时间戳依赖漏洞（标签为0）。




## Reentancy
Reentrancy vulnerability is considered as an invocation to _call.value_ that can call back to itself 
through a chain of calls.


### How to label the reentrancy vulnerability?
We design four local patterns to label the reentrancy vulnerability dataset. The first sub-pattern is **callValueInvocation** 
that checks whether there exists an invocation to call.value in the function. The second sub-pattern **balanceDeduction** checks 
whether the user balance is deducted after money transfer using call.value, which considers the fact that the money stealing 
can be avoided if user balance is deducted each time before money transfer.若合约地址余额的减操作出现在call.value之后，认定该合约满足该sub-pattern；
The third sub-pattern **ValueNoZero** 校验call.value函数本身的参数是否为0，若call.value函数本身的参数为0,此时，认定该合约满足该sub-pattern.
The last sub-pattern **ModifierConstrain** 校验call.value所在函数是否被OnlyOwner修饰器约束，若所在函数未被约束，认定该合约满足该sub-pattern.
当合约满足上述四个sub-pattern，此时，认定该合约存在重入漏洞（标签为1）；否则，认定该合约不存在重入漏洞（标签为0）。


1. 是否存在call.value关键字的调用;  (if true -> 2 else label=0)
2. addr.call.value(value)(), value的值是否大于0;  (if true -> 3 else label=0)
3. addr的减value操作是否在call.value语句之后;  (if true -> 4 else label=0)
4. call.value所在的转账函数有无onlyOwner修饰器约束;  (if true label=0 else label=1)


### CallValueInvoc

Note that we treat those contracts with the key word of call.value as the research targets. As such, we design the 
pattern **callValueInvocation** to filter those functions without the key word of call.value.
若合约不存在call.value关键字，此时，认定该合约不存在重入漏洞（标签为0）； 否则，继续对该合约进行校验.


### ValueNoZero

Case 1:当合约中存在call.value关键字，若call.value函数的参数为0，此时，认定该合约不存在重入漏洞（标签为0）；否则，继续对该合约进行校验。
     
     ```
        1.contract HiroyukiCoinDark {
        2.    mapping(address => uint256) public balanceOf;
        3.    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
        4.        require(balanceOf[msg.sender] >= _value);
        5.        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        6.        balanceOf[_to] = balanceOf[_to] + _value;
        7.        assert(msg.sender.call.value(0)());
        8.        return true;
        9.    }
        10.}
    ```
    
以上述合约为例，合约第7行call.value的参数为0；显然，满足情形1的定义，此时，认定该合约HiroyukiCoinDark不存在重入漏洞（标签为0）。


### BalanceDeduction

Case 1:当合约存在call.value关键字且参数不为0，若调用call.value函数的合约地址余额减操作在call.value之前，此时，认定该合约不存在重入漏洞（标签为0）；否则，继续对该合约进行校验。
    
    ```
        1.contract NIZIGEN {
        2.    mapping (address => uint) balances;  
        3.    function transfer(uint _value, bytes _data) public returns (bool) { 
        4.      if(true) {
        5.          if (balances[msg.sender] < _value) revert();
        6.          balances[msg.sender] = balances[msg.sender] - _value;
        7.          assert(msg.sender.call.value(_value)(_data));
        8.          return true;
        9.      }
        10.      else {
        11.          return false;
        12.      }
        13.    }
        14.}
    ```
    
以上述合约为例，合约第6行合约地址的余额减操作位于第7行call.value调用之前；显然，满足情形1的定义，此时，认定该合约NIZIGEN不存在重入漏洞（标签为0）。


### ModifierDeclaration

Case 1:当合约满足上述3个pattern，若关键字call.value所在的函数有onlyOwner修饰器约束，此时，认定该合约不存在重入漏洞（标签为0)。
    
    ```
        1.contract CrowdsaleWPTByRounds {
        2.  mapping (address => uint) balances;
        3.  address wallet;
        4.  address owner;
        5.  modifier onlyOwner() {
        6.    require(msg.sender == owner);
        7.    _;
        8.  }   
        9.  function _forwardFunds() internal onlyOwner {
        10.     wallet.call.value(msg.value).gas(10000000)();
        11.     balances[wallet] -= msg.value;
        12.  }
        13.}
    ```
    
以上述合约为例，合约第5行存在关键字call.value，表明合约满足CallValueInvoc；且call.value函数的参数为msg.value而非0，表明该合约满足ValueNoZero；
合约第6行余额减操作在call.value调用之后，表明该合约满足BalanceDeduction；且call.value所在函数_forwardFunds()被onlyOwner修饰器修饰;
显然，该合约符合对情形1的定义，则认为该合约CrowdsaleWPTByRounds不存在重入漏洞（标签为0）。

Case 2:当合约满足上述3个pattern，若关键字call.value所在的函数无onlyOwner修饰器约束，此时，认定该合约存在重入漏洞（标签为1)。
      
      ```
        1.contract CrowdsaleWPTByRounds {
        2.  mapping (address => uint) balances;
        3.  address wallet;
        4.  function _forwardFunds() internal {
        5.    wallet.call.value(msg.value).gas(10000000)();
        6.    balances[wallet] -= msg.value;
        7.  }
        8.}
    ```
    
以上述合约为例，合约第5行存在关键字call.value，表明合约满足CallValueInvoc；且call.value函数的参数为msg.value而非0，表明该合约满足ValueNoZero；
合约第6行余额减操作在call.value调用之后，表明该合约满足BalanceDeduction；且call.value所在函数_forwardFunds()并未被onlyOwner修饰器修饰；
显然，该合约符合对情形1的定义，则认为合约CrowdsaleWPTByRounds存在重入漏洞（标签为1）。



## Integer Overflow/Underflow


### How to label the integer overflow/underflow vulnerability?
We design three xxx patterns to label the integer overflow/underflow vulnerability dataset. 
The first sub-pattern is **ArithmeticOperation**, 校验合约变量之间是否存在算数运算，若合约变量之间存在算数运算，认定该合约满足pattern1;
The second sub-pattern is **SafeLibraryInvoc**, 校验合约变量之间的算数运算是否有安全库函数约束，若算数运算未被安全库函数约束，认定该合约满足pattern2;
The last sub-pattern is **ConditionDeclaration**, 校验进行算数运算的合约变量是否被条件语句判断，若合约变量未被条件语句判断，认定该合约满足pattern3.
若合约满足上述3个pattern，此时，认定该合约存在整数溢出漏洞（标签为1），否则，认定该合约不存在整数溢出漏洞(标签为0).

1. 判断变量之间是否存在算术运算；(if true to 2 else label = 0)
2. 判断变量之间算术运算是否有安全库函数约束；(if false to 3 else label = 0)
3. 判断变量是否有条件语句约束；(if true label = 0 else label = 1)


### ArithmeticOperation

若合约变量之间不存在算数运算符("+","-","*"), 此时，认定该合约不存在整数溢出漏洞(标签为0); 否则, 继续对该合约进行校验.


### SafeLibraryInvoc

Case 1: 若合约变量之间存在算数运算, 且算数运算被安全库函数约束, 此时, 认定该合约不存在整数溢出漏洞(标签为0); 否则，继续对该合约进行校验。
    
    ```
        1.library SafeMath {
        2.    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        3.      assert(b <= a);
        4.      return a - b;
        5.    }
        6.    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        7.      c = a + b;
        8.      assert(c >= a);
        9.      return c;
        10.    }
        11.}
        12.contract StandardToken {
        13.    using SafeMath for uint256;
        14.    mapping(address => uint256) balances; 
        15.    function transfer(address _to, uint256 _value) public returns (bool){
        16.        balances[msg.sender] = balances[msg.sender].sub(_value);
        17.        balances[_to] = balances[_to].add(_value);
        18.        return true;
        19.    }
        20. }
    ```
    
以上述合约为例，合约第16行balances[mag.sender]变量和_value变量之间的减法（sub）运算，被合约第2行的安全库函数约束；显然，符合对情形1的定义，
此时，认定该合约StandardToken不存在整数溢出漏洞（标签为0）。


### ConditionDeclaration

case 1:若合约变量之间存在加法运算(或乘法运算), 且加法运算(或乘法运算)未被安全库函数约束, 
当加法运算和与加法因子(或乘法运算乘积与乘法因子)同时出现在条件语句(assert、require、if、while)中进行比较且条件语句出现在加法运算(或乘法运算)之后，
此时，认定该合约不存在整数溢出漏洞(标签为0).
   
    ```
    1.contract Overflow_fixed_assert {
    2.    uint8 sellerBalance = 0;
    3.    function add(uint8 value) returns (uint){
    4.        sellerBalance += value;
    5.        assert(sellerBalance >= value);
    6.        return sellerBalance;
    7.    }
    8.}
    ```
    
以上述合约为例，合约第4行sellerBalance变量和value变量之间存在加法运算，且加法运算并未被安全库函数约束，
表明该合约满足ArithmeticOperation和SafeLibraryNoInvoc；合约第5行的assert语句中包含对加法运算的结果和因子的比较；
显然，该合约符合对情形1的定义，则认为该合约Overflow_fixed_assert不存在整数溢出漏洞（标签为0）。

case 2:若合约变量之间存在减法运算，且减法运算未被安全库函数约束，当减法运算被减数与减数同时出现在条件语句（assert、require、if、while）
中进行比较且条件语句出现在减法运算之前，此时，认定该合约不存在整数溢出漏洞（标签为0）。

    ```
    1.contract HiroyukiCoinDark {
    2.    mapping(address => uint256) public balanceOf;
    3.    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
    4.        require(balanceOf[msg.sender] >= _value);
    5.        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
    6.        balanceOf[_to] = balanceOf[_to] + _value;
    7.        assert(msg.sender.call.value(_value)());
    8.        return true;
    9.    }
    10.}
    ```
 
以上述合约为例，合约第5行balanceOf\[msg.sender]变量和_value变量之间存在减法运算，且减法运算并未被安全库函数约束，
表明该合约满足ArithmeticOperation和SafeLibraryNoInvoc；合约第4行的require语句中包含对减法运算的被减数和减数的比较；
显然，该合约符合对情形2的定义，则认为该合约HiroyukiCoinDark不存在整数溢出漏洞（标签为0）。


case 3:若合约变量之间存在算数运算，且算数运算未被安全库函数约束，当合约不满足case 1和case 2，此时，认定该合约存在整数溢出漏洞（标签为1）。
    
    ```
    1. contract Overflow_add {
    2.    uint8 sellerBalance = 0;
    3.    function add(uint8 value) returns (uint){
    4.        sellerBalance += value;
    5.        return sellerBalance;
    6.    }
    7. }
    ```
    
以上述合约为例，合约第4行sellerBalance变量和value变量之间存在加法运算，但在加法运算之后并未出现任何条件语句对这两个变量进行比较。
显然，该合约符合对情形3的定义，则认为该合约Overflow_add存在整数溢出漏洞（标签为1）。



## Transaction Order Dependence

We design three xxx patterns to label the transaction Order Dependence vulnerability dataset. 

1. 判断某个全局变量是否在两个函数中都出现；(if true to 2 else label = 0)
2. 判断该全局变量是否存在修改操作；(if true label = 1 else label = 0)


### VariableCrossFunc



### VariableAssign




## Dangerous Delegatecall

### How to label the dangerous delegatecall vulnerability?
We design three xxx patterns to label the dangerous delegatecall vulnerability dataset. 
The first sub-pattern is , 检测合约中是否存在delegatecall调用，如果存在，认定该合约满足pattern1;
The second sub-pattern is , 如果合约中的delegatecall调用者不是合约所有者和合约所有者指定的目标地址，认定该合约满足pattern2;
若合约满足上述2个pattern，此时，认定该合约存在委托调用漏洞（标签为1），否则，认定该合约不存在代理调用漏洞(标签为0).
1. 是否存在delegatecall关键字的调用;  (if true -> 2 else label = 0)
2. 判断delegatecall的调用者是否为owner所指定的目标地址;  (if false -> label=1 else label = 0)

### DelegatecallInvoc
若合约中不存在delegatecall调用，则认为合约中不存在委托调用漏洞 (标签为0); 否则, 继续对该合约进行校验.


### pattern 2
case 1:当合约中存在delegate调用时，且delegate调用者是owner指定的，则认为合约中不存在委托调用漏洞 (标签为0)；否则, 继续对该合约进行校验.
   
   ```
   1. contract Proxy {
   2.     address callee;
   3.     address owner;
   4.     modifier onlyOwner {
   5.           require(msg.sender == owner);
   6.          _;
   7.     }
   8.     function setCallee(address newCallee) public onlyOwner {
   9.         callee = newCallee;
   10.   }
   11.   function forward(bytes _data) public {
   12.       require(callee.delegatecall(_data));
   13.   }
   14. }
   ```
   
以上述合约为例,在合约第16行存在delegate调用,调用者为callee；合约第12行setCallee函数的作用是只有owner可以指定一个地址作为callee；
显然，该合约符合对情形2的定义，则认为该合约Proxy不存在委托调用漏洞（标签为0）。
case2:当合约中存在delegate调用时，且delegate调用者是owner指定的，则认为合约中不存在委托调用漏洞 (标签为0)；否则, 继续对该合约进行校验.
    
    ```
    1. contract Proxy { 
    2.    address owner;
    3.    function forward(address callee, bytes _data) public {
    4.       require(callee.delegatecall(_data));
    5.    }
    6. }
    ```
    
以上述合约为例，合约第7行出现delegatecall调用，并且调用者不是由owner所指定的目标位置；并且在调用成功后能顺利地通过条件约束，最终修改合约状态。
显然，该合约符合对情形3的定义，则认为该合约Proxy存在委托调用漏洞（标签为1）。

