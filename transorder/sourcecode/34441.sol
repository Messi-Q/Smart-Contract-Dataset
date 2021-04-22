contract InsightsNetwork1 {

  mapping (address => uint) public unlockTimes;
  address public owner;

  function register(address newTokenHolder, uint issueAmount) {
        uint currentTime = block.timestamp;
        uint unlockTime = currentTime + 365*24*60*60;
        assert(unlockTime > currentTime);
        unlockTimes[newTokenHolder] = unlockTime;
  }

  function setOwner(address nextOwner) public auth {
        require(currentTime > block.timestamp);
        owner = nextOwner;
    }
}