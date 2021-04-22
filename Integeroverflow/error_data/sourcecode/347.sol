
contract CrowdsaleWPTByRounds {
   
  mapping (address => uint) balances;
  address wallet;

  function _forwardFunds() internal {
     wallet.call.value(msg.value).gas(10000000)();
     balances[wallet] -= msg.value;
  }
}