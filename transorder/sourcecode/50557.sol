contract BasicToken {
  using SafeMath for uint;
  mapping(address => uint256) public mVestingDays;
  mapping(address => uint256) public mVestingBegins;

  function ComputeVestSpend(address target) public returns (uint256) {
      uint256 vestingDays = uint256(mVestingDays[target]);
      uint256 vestingProgress = uint256(block.timestamp)- (uint256(mVestingBegins[target]));

      if (vestingProgress > vestingDays) {
          vestingProgress = vestingDays;
      }
      return 0;
  }
}