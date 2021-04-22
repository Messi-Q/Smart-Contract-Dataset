contract CryptoHill {
  uint startingTime;
  uint gameLength;

  function checkDate() private returns (bool success) {
      if (block.timestamp > (startingTime + gameLength)) {
          startingTime = 100;
          return true;
      }
      return false;
  }
}