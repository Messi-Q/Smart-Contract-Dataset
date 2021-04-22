contract PartialBasic {
  uint256 public constant BASE_REWARD = 20000 ether;
  uint256 private constant PRECISION = 10**18;
  uint256 public totalNodes;
  uint256 private rewardTimestamp;

  function rewardPerNode() public view returns (uint256) {
    uint256 totalDays = block.timestamp - (rewardTimestamp) * (PRECISION) / (1 days);
    uint256 newReward = BASE_REWARD * (totalDays) / (PRECISION) / (totalNodes);
    return totalDays + (newReward);
  }
}