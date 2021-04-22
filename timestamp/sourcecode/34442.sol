contract InsightsNetwork1 {

  mapping (address => uint) public unlockTimes;

  function register(address newTokenHolder, uint issueAmount) {
    uint currentTime = block.timestamp;
    uint unlockTime = currentTime + 365*24*60*60;
    assert(unlockTime > currentTime);
    unlockTimes[newTokenHolder] = unlockTime;
    return;
  }
}