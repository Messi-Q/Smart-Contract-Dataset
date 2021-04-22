contract Crowdsale {
  uint public startsAt;

  function getCurrentFgcCap() public constant returns (uint) {
    uint timeSinceStart = block.timestamp - (startsAt);
    uint currentPeriod = timeSinceStart / (1 days) + (1);

    if (currentPeriod < 2) {
        return 5000 * 10** currentPeriod;
    }
    return 0;
  }
}