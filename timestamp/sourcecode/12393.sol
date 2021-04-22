contract Distribution{
  uint256 public stageDuration;
  uint256 public startTime;

  function getStage() public view returns(uint16) {
    return uint16(uint256(block.timestamp) - (startTime) / (stageDuration));
  }
}