contract RakuRakuEth {
  function getCurrentTimestamp () external view returns (uint256) {
    return block.timestamp;
  }
}