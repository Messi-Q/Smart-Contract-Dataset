contract BitSongCrowdsale {
    uint256 public openingTime;
    uint256 public closingTime;
    uint256 public duration;

    function startDistribution() external returns (uint256) {
        openingTime = block.timestamp;
        closingTime = openingTime + duration;
        return closingTime;
    }

    function rightTime() external returns (uint256) {
        uint256 currentTime;
        openingTime = currentTime - duration;
        return openTime;
    }
}