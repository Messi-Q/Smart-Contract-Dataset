contract BasicToken {

  mapping(address => uint256) public mVestingDays;   
  mapping(address => uint256) public mVestingBegins;

  function ComputeVestSpend(address target) public returns (uint256) {
      int256 vestingDays = int256(mVestingDays[target]);
      int256 vestingProgress = (int256(block.timestamp) - int256(mVestingBegins[target])) / (int256(24*60*60));

      if (vestingProgress > vestingDays) {
          vestingProgress = vestingDays;
      }

      return 0;
  }
}