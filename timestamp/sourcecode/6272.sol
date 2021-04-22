contract JadeCoin {
  mapping(address => uint256) public jadeBalance;
  mapping(address => uint256) public lastJadeSaveTime;  

  function updatePlayersCoinByOut(address player) external returns (bool){
    lastJadeSaveTime[player] = block.timestamp;
    jadeBalance[player] = jadeBalance[player] + 100;
    return true;
  }
}