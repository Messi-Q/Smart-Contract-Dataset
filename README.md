# Smart contract vulnerability dataset

**This repository releases the official datasets for five types of smart contract vulnerabilities, and gives the instructions for how to label the these vulnerability datasets.**



## Timestamp Dependence
Block timestamp dependence is considered as using _block.timestamp_ (or _block.number_) as part of the conditions to perform critical operations.


### How to label the timestamp dependency vulnerability?
We design three local patterns to label the timestamp dependence vulnerability dataset. 
The first pattern **timestampInvocation** models whether there exists an invocation to _block.timestamp_ in the function.
The second pattern **timestampAssign** checks whether the value of _block.timestamp_ is assigned to other variables or passed to a condition statement as a parameter, namely whether _block.timestamp_ is actually used. 
Last, the third pattern **timestampContaminate** checks if _block.timestamp_ may contaminate the triggering condition of a critical operation (e.g., money transfer) or the return value.
We label a function with timestamp dependence vulnerability as:**TimestampInvoc ∧ (TimestampAssign ∨ TimestampContaminate)**.


### timestampInvocation

Note that we treat those functions with the key word of _block.timestamp_ as the research targets. As such, we utilize the pattern **timestampInvoc** to filter those functions without the key word of _block.timestamp_. 


### timestampAssign 

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


Case 2: When the value of _block.timestamp_ is assigned by the condition statements (e.g., _require_ and _assert_), we consider 
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
is assigned in the require statement (line 7). Therefore, we mark that the function _withdrawal_ does not exist the 
timestamp dependency vulnerability, i.e., label = 0.


### timestampContaminate

case 1：When the control content of the conditional statement(e.g. _if_ and _while_) involves the return value of the function,
we label the corresponding function exists the timestamp dependency vulnerability.

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
       
For instance, when the conditional statement _else if_ satisfies _block.timestamp <startsAt_(line8)_, the return value of the function _getState_ is _State.PreFunding_;
Therefore, we mark that the function _getState_ exist the timestamp dependency vulnerability, i.e., label = 1.

Case 2：When the control content of the conditional statement involves money operations(e.g.,_transfers_),
we label the corresponding function exists the timestamp dependency vulnerability.
    
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
    

For instance, when the conditional statement _while_ satisfies _release != 0 && block.timestamp> release_(line 5), the contract executes the _call.value_ transfer operation(line 7);
Therefore, we mark that the function _releaseAll_ exist the timestamp dependency vulnerability, i.e., label = 1.

Case 3：When the control content of the conditional statement don't relate with the return value of the function and money operations(e.g,transfer), 
we label the corresponding function does not exist the timestamp dependency vulnerability.
    
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
    

For instance, when the conditional statement _if_ is satisfied _block.timestamp <birthday_, the function _Take_ throws an exception;
Therefore, we mark that the function _Take_ dose not exist the timestamp dependency vulnerability, i.e., label = 0.


## Reentrancy
Reentrancy vulnerability is considered as an invocation to _call.value_ that can call back to itself 
through a chain of calls.


### How to label the reentrancy vulnerability?
We design four local patterns to label the reentrancy vulnerability dataset. 
The first sub-pattern is **callValueInvocation** that checks whether there exists an invocation to call.value in the function.
The second sub-pattern **balanceDeduction** checks whether the user balance is deducted after money transfer using _call.value_, which considers the fact that the money stealing 
can be avoided if user balance is deducted each time before money transfer.
The third sub-pattern **valueNegative** checks whether the parameter of the _call.value_ function itself is zero.
The last sub-pattern **ModifierConstrain** checks whether the function corresponding _call.value_ is constrained by the _OnlyOwner_ modifier.
We label a function with reentrancy vulnerability as: **callValueInvocation ∧ balanceDeduction ∧ ValueNegative ∧ (!ModifierConstrain)**.



### callValueInvocation

Note that we treat those contracts with the key word of call.value as the research targets. As such, we design the 
pattern **callValueInvocation** to filter those functions without the key word of _call.value_.


### valueNegative

Case 1:When the _call.value_ exists in the contract, and the parameter of the call.value function is zero; 
we label the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0. Otherwise, continues to verify the function.
     
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
    
For instance, the parameter of _call.value_ is zero(line 7); 
Therefore, we mark that the function _transfer_ dose not exist the reentrancy vulnerability, i.e., label = 0.


### balanceDeduction

Case 1:When the parameter of _call.value_ is not zero, the user balance is deducted before money transfer using _call.value_; 
we label the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0. Otherwise, continues to verify the function.
   
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
    
For instance, the user balance _balances[msg.sender]_(line 6) is deducted before money transfer using _call.value_ (line 7);
we label the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0.

### modifierDeclaration

Case 1:When function corresponding _call.value_ has the _onlyOwner_ modifier constraint;
we label the corresponding function does not exist the reentrancy vulnerability.
    
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
    
For instance, the function __forwardFunds_ corresponding _call.value_ is constraint by the _onlyOwner_ modifier(line 9);
we label the function __forwardFunds_ does not exist the reentrancy vulnerability, i.e., label = 0.


Case 2:When function corresponding _call.value_ has not the _onlyOwner_ modifier constraint;
we label the corresponding function exists the reentrancy vulnerability.
      
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
    
For instance, the function __forwardFunds_ corresponding _call.value_ is not constraint by the _onlyOwner_ modifier(line 9);
we label the function __forwardFunds_ exists the reentrancy vulnerability, i.e., label = 1.



## Integer Overflow/Underflow
Integer Overflow/Underflow is considered as using srithmetic operation (e.g. +, -, *) between variables lead to the value of variables out of range.


### How to label the integer overflow/underflow vulnerability?
We design three patterns to label the integer overflow/underflow vulnerability dataset. 
The first sub-pattern is **arithmeticOperation** that checks whether there is arithmetic operation between variables.
The second sub-pattern is **safeLibraryInvocation** that checks whether the arithmetic operations between variables are constraint by security library function.
The last sub-pattern is **conditionDeclaration** that checks whether the variable for arithmetic operation is judged by the conditional statement.
We label a function with integer overflow/underflow vulnerability as:**ArithmeticOperation ∧ (SafeLibraryInvoc ∨ ConditionDeclaration)**.

### arithmeticOperation
Note that we treat those contracts with the key word of arithmetic operator(e.g. +, -, *) as the research targets. As such, we design the 
pattern **arithmeticOperation** to filter those functions without the key word of arithmetic operator.


### safeLibraryInvoc

Case 1: When there are arithmetic operations between the variables, and the arithmetic operations are constrainted by the security library function;
we label the corresponding function dose not exist the Integer Overflow/Underflow vulnerability.
    
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
    
For instance, the subtraction operation between the _balances[mag.sender]_ and the __value_ (line 16) is constrained by the security library function (line 2); 
we label the corresponding function _transfer_ dose not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.


### conditionDeclaration

case 1:If there is an addition operation (or multiplication operation) between contract variables;
When the summation and addition factor (or the product and the multiplication factor) appear in the conditional statement (e.g.assert, require, if, while) for comparison,
and the conditional statement appears after the addition operation (or multiplication operation);
we label the corresponding function dose not exist the Integer Overflow/Underflow vulnerability.
   
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
    
For instance, there is an addition operation between the _sellerBalance_ and the _value_ (line 4) ,
and _assert_ statement contains the comparison between the result of the addition operation and the factor (line 5);
we label the corresponding function _add_ dose not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.

case 2:If there is a subtraction operation between the contract variables,
when the minute and minus appear in the conditional statement (assert, require, if, while) for comparison,
and the conditional statement appears before the subtraction operation;
we label the corresponding function dose not exist the Integer Overflow/Underflow vulnerability.

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
 
For instance, there is a subtraction operation between the _balanceOf[msg.sender]_ and the __value_ variable (line 5),
and require statement contains the comparison between the minute and minus of the subtraction operation (line 4);
we label the corresponding function dose not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.


case 3:If there are arithmetic operations between contract variables, when the contract does not satisfy case 1 and case 2;
we label the corresponding function exists the Integer Overflow/Underflow vulnerability.
    
    ```
    1. contract Overflow_add {
    2.    uint8 sellerBalance = 0;
    3.    function add(uint8 value) returns (uint){
    4.        sellerBalance += value;
    5.        return sellerBalance;
    6.    }
    7. }
    ```
    
For instance, there is an addition operation between the sellerBalance and the value variable (line 4), 
and no conditional statement to compare the two variables after the addition operation;
we label the corresponding function _add_ exists the Integer Overflow/Underflow vulnerability, i.e., label = 1.


## Dangerous Delegatecall
Dangerous delegatecall vulnerability is considered as using _delegate_ as part of the conditions to perform critical operations.

### How to label the dangerous delegatecall vulnerability?
We design three patterns to label the dangerous delegatecall vulnerability dataset. 
The first sub-pattern is **delegateInvocation** models whether there exists an invocation to _delegate_ in the function;
The second sub-pattern is **targetCaller** that checks whether the caller of _delegate_ is the target address specified by owner;
We label a function with dangerous delegatecall vulnerability as:**DelegatecallInvoc ∧ (!TargetCaller)**.

### delegateInvocation
Note that we treat those contracts with the key word of delegate as the research targets. As such, we design the 
pattern **delegateInvocation** to filter those functions without the key word of _delegate_.

### targetCaller
case 1: When the _delegate_ exists in the contract, and the delegate caller is specified by the owner;
we label the corresponding function does not exist the dangerous delegatecall vulnerability.
   
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
   
For instance, the _delegate_ caller is _callee_ (line 12), and _callee_ is the target address specified by owner;
we label the corresponding function _forward_ does not exist the dangerous delegatecall vulnerability, i.e., label = 0;

case2: When the _delegate_ exists in the contract, and the delegate caller is not specified by the owner;
we label the corresponding function exists the dangerous delegatecall vulnerability. 
    
    ```
    1. contract Proxy { 
    2.    address owner;
    3.    function forward(address callee, bytes _data) public {
    4.       require(callee.delegatecall(_data));
    5.    }
    6. }
    ```
    
For instance, the _delegate_ caller is _callee_ (line 4), and _callee_ is not the target address specified by owner;
we label the function _forward_ exists the dangerous delegatecall vulnerability, i.e., label = 1;