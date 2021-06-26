# Smart contract vulnerability dataset

**This repository releases the official smart contract dataset of our paper, which consists of four types of vulnerabilities. In what follows, we present the instructions of how to label the specific vulnerability.**



## Download Dataset
We will release the smart contract dataset that consists of four types of vulnearbilities, namely timestamp dependence, reentrancy, interger overflow/underflow, and delegatecall. 



## 1 Timestamp Dependence
Block timestamp dependence is considered as using *block.timestamp* as part of the conditions to perform critical operations.


### How to label the timestamp dependency vulnerability?
We refer to several expert patterns to label the timestamp dependence vulnerability. 
1) **timestampInvocation** models whether there exists an invocation to *block.timestamp* in the function. 
2) **timestampAssign** checks whether the value of *block.timestamp* is assigned to other variables or passed to a condition statement as a parameter, namely whether *block.timestamp* is actually used. 
3) **timestampContaminate** checks if *block.timestamp* may contaminate the triggering condition of a critical operation (e.g., money transfer) or the return value.
We label a function with timestamp dependence vulnerability based on: **TimestampInvoc ∧ (TimestampAssign ∨ TimestampContaminate)**.


#### timestampInvocation

Note that we treat those functions with the *block.timestamp* statement as the research targets. As such, we utilize the pattern **timestampInvoc** to filter those functions without the statement of *block.timestamp*. 


#### timestampAssign 

Case 1：When the *block.timestamp* is assigned to a variable and the variable is used by the following operations or passed to a condition statement as a parameter, we label the corresponding function existing the timestamp dependency vulnerability.
    
    ```    
        1.contract CrowdsaleWPTByRounds {
        2.    uint256 public closingTime;       
        3.    function closeRound() public returns(uint256) {
        4.        closingTime = block.timestamp + 1;
        5.        return closingTime;
        6.    }
        7.}
    ```
 
As can be seen, the *block.timestamp* is assigned to variable *closingTime* (line 4), and the variable *closingTime* is called in the return statement (line 5). Thus, we label the function *closeRound* existing the timestamp dependency vulnerability, i.e., label = 1.


Case 2: When the *block.timestamp* is assigned in the strict condition statements (e.g., _require_ and _assert_), we label that the corresponding function does not exist the timestamp dependency vulnerability.

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
    
As can be seen, the *block.timestamp* is assigned to the variable *time* (line 6), and the variable *time* is assigned in the *require* statement (line 7). Thus, we label that the function *withdrawal* does not exist the timestamp dependency vulnerability, i.e., label = 0.


#### timestampContaminate

case 1：When the body of the conditional statement (e.g. _if_ and _while_) involves the return value of the function, we label the corresponding function existing the timestamp dependency vulnerability.

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
       
As can be seen, when the conditional statement _else if_ satisfies _block.timestamp < startsAt_ (line8), the return value of the function _getState_ is _State.PreFunding_. Thus, we label the function _getState_ existing the timestamp dependency vulnerability, i.e., label = 1.

Case 2：When the body of the conditional statement involves money operations (e.g.,_transfers_), we label the corresponding function existing the timestamp dependency vulnerability.
    
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
    

As can be seen, when the conditional statement _while_ satisfies _release != 0 && block.timestamp > release_ (line 5), the function executes the _call.value_ transfer operation (line 7). Thus, we label the function _releaseAll_ existing the timestamp dependency vulnerability, i.e., label = 1.

Case 3：When the body of the conditional statement is not related to the return value of the function or money operations (e.g., transfer), we label that the corresponding function does not exist the timestamp dependency vulnerability.
    
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
    

As can be seen, when the conditional statement _if_ satisfies _block.timestamp < birthday_ (line 6), the function _Take_ throws an exception. Thus, we label that the function _Take_ does not exist the timestamp dependency vulnerability, i.e., label = 0.





## 2 Reentrancy
Reentrancy vulnerability is considered as an invocation to _call.value_ that can call back to itself through a chain of calls.


### How to label the reentrancy vulnerability?
We refer to several expert patterns to label the reentrancy vulnerability. 
1) **callValueInvocation** that checks whether there exists an invocation to call.value in the function.
2) **balanceDeduction** checks whether the user balance is deducted after money transfer using _call.value_, which considers the fact that the money stealing 
can be avoided if user balance is deducted each time before money transfer.
3) **zeroParameter** checks whether the parameter of the _call.value_ function itself is zero.
4) **ModifierConstrain** checks whether the function is constrained by the _onlyOwner_ modifier.
We label a function with reentrancy vulnerability based on: **callValueInvocation ∧ balanceDeduction ∧ zeroParameter ∧ (!ModifierConstrain)**.



#### callValueInvocation

Note that we treat those functions with an invocation to *call.value* as the research targets. As such, we utilize the pattern **callValueInvocation** to filter those functions without an invocation to _call.value_.


#### zeroParameter

Case 1: When the _call.value_ exists in the function and the parameter of the *call.value* is zero, we label that the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0.
     
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
    
As can be seen, the parameter of _call.value_ is zero (line 7). Thus, we label that the function _transfer_ dose not exist the reentrancy vulnerability, i.e., label = 0.


#### balanceDeduction

Case 1: When the parameter of _call.value_ is not zero and the user balance is deducted before money transfer using _call.value_, we label that the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0.
   
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
    
As can be seen, the user balance _balances[msg.sender]_(line 6) is deducted before money transfer using _call.value_ (line 7). Thus, we label that the corresponding function does not exist the reentrancy vulnerability, i.e., label = 0.

#### modifierDeclaration

Case 1: When a function has the _onlyOwner_ modifier constraint, we label that the corresponding function does not exist the reentrancy vulnerability.
    
    ```
        1.contract CrowdsaleWPTByRounds {
        2.  mapping (address => uint) balances;
        3.  address wallet;
        4.  address owner;
        5.  modifier onlyOwner() {
        6.    require(msg.sender == owner);
        7.    _;
        8.  }   
        9.  function forwardFunds() internal onlyOwner {
        10.     wallet.call.value(msg.value).gas(10000000)();
        11.     balances[wallet] -= msg.value;
        12.  }
        13.}
    ```
    
As can be seen, the function _forwardFunds_ is constrained by the _onlyOwner_ modifier(line 9). Thus, we label that the function _forwardFunds_ does not exist the reentrancy vulnerability, i.e., label = 0.


Case 2: When a function has not the _onlyOwner_ modifier constraint, we label the corresponding function existing the reentrancy vulnerability.
      
      ```
        1.contract CrowdsaleWPTByRounds {
        2.  mapping (address => uint) balances;
        3.  address wallet;
        4.  function forwardFunds() internal {
        5.    wallet.call.value(msg.value).gas(10000000)();
        6.    balances[wallet] -= msg.value;
        7.  }
        8.}
    ```
    
As can be seen, the function _forwardFunds_ is not constrained by the _onlyOwner_ modifier(line 9). Thus, we label the function _forwardFunds_ existing the reentrancy vulnerability, i.e., label = 1.




## 3 Integer Overflow/Underflow
Integer Overflow/Underflow is considered as using arithmetic operations *(e.g., +, -, *)* between variables, which may lead to the value of variables out of range.


### How to label the integer overflow/underflow vulnerability?
We refer to several expert patterns to label the integer overflow/underflow vulnerability. 
1) **arithmeticOperation** that checks whether there is arithmetic operation between variables.
2) **safeLibraryInvocation** that checks whether the arithmetic operations between variables are constrained by a security library function.
3) **conditionDeclaration** that checks whether the variable for the arithmetic operation is judged by the conditional statement.
We label a function with integer overflow/underflow vulnerability based on: **ArithmeticOperation ∧ (SafeLibraryInvoc ∨ ConditionDeclaration)**.

#### arithmeticOperation
Note that we treat those functions with the arithmetic operations _(e.g., +, -, *)_ as the research targets. As such, we utilize the pattern **arithmeticOperation** to filter those functions without the arithmetic operations.


#### safeLibraryInvoc

Case 1: When there are arithmetic operations between the variables and the arithmetic operations are constrained by the security library function, we label that the corresponding function does not exist the Integer Overflow/Underflow vulnerability.
    
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
        15.    function transfer(address to, uint256 value) public returns (bool) {
        16.        balances[msg.sender] = balances[msg.sender].sub(value);
        17.        balances[to] = balances[to].add(value);
        18.        return true;
        19.    }
        20.}
    ```
    
As can be seen, the subtraction operation between the _balances[msg.sender]_ and the _value_ (line 16) is constrained by the security library function (line 2). Thus, we label that the corresponding function _transfer_ does not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.


#### conditionDeclaration

case 1: When the arithmetic operations and corresponding variables appear in the strict conditional statements (e.g., assert, require), we label that the corresponding function does not exist the Integer Overflow/Underflow vulnerability.
   
    ```
        1.contract Overflow_fixed_assert {
        2.    uint8 sellerBalance = 0;
        3.    function add(uint8 value) returns (uint) {
        4.        sellerBalance += value;
        5.        assert(sellerBalance >= value);
        6.        return sellerBalance;
        7.    }
        8.}
    ```
    
As can be seen, there is an addition operation between the _sellerBalance_ and the _value_ (line 4), and _assert_ statement contains the comparison between the r_sellerBalance_ and the _value_ (line 5). Thus, we label that the corresponding function _add_ does not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.

Case 2: When the subtraction operation appears in the strict conditional statement (e.g., assert, require) for comparison and the conditional statement appears before the subtraction operation, we label that the corresponding function does not exist the Integer Overflow/Underflow vulnerability.

    ```
        1.contract HiroyukiCoinDark {
        2.    mapping(address => uint256) public balanceOf;
        3.    function transfer(address to, uint value, bytes data) public returns (bool) {
        4.        require(balanceOf[msg.sender] >= value);
        5.        balanceOf[msg.sender] = balanceOf[msg.sender] - value;
        6.        balanceOf[to] = balanceOf[_to] + value;
        7.        assert(msg.sender.call.value(value)());
        8.        return true;
        9.    }
        10.}
    ```
 
As can be seen, there is a subtraction operation between the _balanceOf[msg.sender]_ and the _value_ (line 5), and the _require_ statement contains the comparison between the _balanceOf[msg.sender]_ and the _value_ (line 4). Thus, we label that the corresponding function dose not exist the Integer Overflow/Underflow vulnerability, i.e., label = 0.


Case 3: When the function does not satisfy case 1 and case 2, we label the corresponding function existing the Integer Overflow/Underflow vulnerability.
    
    ```
        1. contract Overflow_add {
        2.    uint8 sellerBalance = 0;
        3.    function add(uint8 value) returns (uint) {
        4.        sellerBalance += value;
        5.        return sellerBalance;
        6.    }
        7. }
    ```
    
As can be seen, there is an addition operation between the _sellerBalance_ and the _value_ (line 4), and no conditional statement used to constrain the two variables after the addition operation. Thus, we label the corresponding function _add_ existing the Integer Overflow/Underflow vulnerability, i.e., label = 1.




## 4 Dangerous Delegatecall
Dangerous delegatecall vulnerability is considered as using _delegate_ as part of the conditions to perform critical operations.

### How to label the dangerous delegatecall vulnerability?
We refer to several expert patterns to label the dangerous delegatecall vulnerability. 
1) **delegateInvocation** models whether there exists an invocation to _delegatecall_ in the function;
2) **ownerInvocation** that checks whether the caller of _delegatecall_ is the owner account;
We label a function with dangerous delegatecall vulnerability based on: **DelegatecallInvoc ∧ (!ownerInvocation)**.

#### delegateInvocation
Note that we treat those functions with the statemnet of *delegatecall* as the research targets. As such, we utilize the pattern **delegateInvocation** to filter those functions without the statemnet of *delegatecall*.

#### ownerInvocation
Case 1: When the _delegatecall_ exists in the function and the caller is the owner account, we label that the corresponding function does not exist the dangerous delegatecall vulnerability.
   
   ```
       1.contract Proxy {
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
       14.}
   ```
   
As can be seen, the caller of _delegatecall_ is _callee_ (line 12), and _callee_ is the target address of the owner account, we thus label that the corresponding function _forward_ does not exist the dangerous delegatecall vulnerability, i.e., label = 0;

Case 2: When the _delegatecall_ exists in the function and the caller of _delegatecall_ is not the owner account, we label the corresponding function existing the dangerous delegatecall vulnerability. 
    
    ```
        1.contract Proxy { 
        2.    address owner;
        3.    function forward(address callee, bytes _data) public {
        4.       require(callee.delegatecall(_data));
        5.    }
        6.}
    ```
    
As can be seen, the caller of _delegatecall_ is _callee_ (line 4), and _callee_ is not the owner account, we thus label the function _forward_ existing the dangerous delegatecall vulnerability, i.e., label = 1.





