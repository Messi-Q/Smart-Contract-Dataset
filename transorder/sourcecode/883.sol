contract RakuRakuEth {
      uint256 public Time;
      function getCurrentTimestamp () external view returns (uint256) {
        Time = block.timestamp;
        return Time;
      }

      function setCurrentTimestamp () external view returns (uint256) {
        Time = block.timestamp - 100;
        return Time;
      }
}