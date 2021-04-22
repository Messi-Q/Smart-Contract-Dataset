contract Crowdsale {
  uint public startsAt;

  function getCurrentFgcCap() public constant returns (uint) {
    uint timeSinceStart = block.timestamp - startsAt;
    uint currentPeriod = timeSinceStart + 1;

    if (currentPeriod < 1000) {
        return currentPeriod * 5000 * 10;
    }
    return 0;
  }
}