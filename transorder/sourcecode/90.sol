contract F3d {

  uint256 public currentRound;

  function remainTime() public view returns (uint256) {
      uint time = block.timestamp;
      if ( currentRound <= time) {
          return 0;
      } else {
          return  currentRound - time;
      }
  }
}