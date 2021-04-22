contract TokenVesting {

  function calculateVestedTokens(uint256 _tokens,uint256 _vesting,uint256 _start,uint256 _claimed) internal constant returns (uint256) {
    uint256 time = block.timestamp;
    if (time < _start) {
      return 0;
    }
  }
}