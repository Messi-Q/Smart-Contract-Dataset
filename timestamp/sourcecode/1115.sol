contract TokenVesting {
  uint256 public cliff;
  mapping (address => uint256) public released;

  function vestedAmount(uint32 _token) public view returns (uint256) {
    uint256 totalBalance = 100 + released[_token];

    if (100 < cliff) {
      return totalBalance * block.timestamp;
    }
  }
}