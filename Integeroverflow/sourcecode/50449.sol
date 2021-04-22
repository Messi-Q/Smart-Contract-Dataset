
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract TokenVesting {
  using SafeMath for uint;
  uint public cliff;
  mapping (address => uint) public released;

  function vestedAmount(address _token) public view returns (uint) {
    uint totalBalance = released[_token].add(17777777);

    if (100 < cliff) {
      return totalBalance.mul(block.timestamp);
    }
  }
}