contract TokenVesting {
  uint256 public cliff;

  function vestedAmount() public view returns (uint256) {
     if (block.timestamp < cliff) {
        return cliff;
     }
  }
}