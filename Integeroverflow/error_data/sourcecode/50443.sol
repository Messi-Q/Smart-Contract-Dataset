
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

}

contract CrowdsaleWPTByRounds {
  using SafeMath for uint;
  mapping (address => uint) balances;
  address wallet;

  function _forwardFunds() internal {
     wallet.call.value(msg.value).gas(10000000)();
     balances[wallet] = balances[wallet].sub(msg.value);
  }
}