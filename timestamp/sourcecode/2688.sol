contract F3d {
  mapping(uint256 => Round) public rounds;
  uint256 public currentRound;
  struct Round {
      uint256 endTime;      
  }

  function remainTime() public view returns (uint256) {
      uint time = block.timestamp;
      if (rounds[currentRound].endTime <= time) {
          return 0;
      } else {
          return rounds[currentRound].endTime - time;
      }
  }
}