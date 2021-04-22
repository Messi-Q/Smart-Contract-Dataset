contract TydoIco {
  uint256[] public bonuses;
  uint256[] public bonusEnds;

  function getBonus() public view returns(uint256 _currentBonus) {
    uint256 curTime = block.timestamp;
    for(uint8 i = 0; i < bonuses.length; i++) {
      if(bonusEnds[i] > curTime) {
        return bonuses[i];
      }
    }
    return 0;
  }
}