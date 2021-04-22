contract PartialBasic {
  uint256 public totalNodes;
  uint256 private rewardTimestamp;

  function rewardPerNode() public view returns (uint256) {
    uint256 totalDays = block.timestamp - rewardTimestamp;
    uint256 newReward = totalDays / totalNodes;
    return totalDays + newReward;
  }
}