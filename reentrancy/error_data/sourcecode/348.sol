
contract CrowdsaleWPTByRounds {

  mapping (address => uint) balances;
  address wallet;

  address owner;
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function _forwardFunds() internal onlyOwner {
     wallet.call.value(msg.value).gas(10000000)();
     balances[wallet] -= msg.value;
  }
}