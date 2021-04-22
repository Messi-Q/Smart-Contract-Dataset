contract DAVToken {

  uint256 public pauseCutoffTime;
  address public owner;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function setPauseCutoffTime(uint256 _pauseCutoffTime) onlyOwner public {
    require(_pauseCutoffTime >= block.timestamp);
    pauseCutoffTime = _pauseCutoffTime;
    return;
  }
}