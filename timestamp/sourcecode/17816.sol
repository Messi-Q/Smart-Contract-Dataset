contract BlocksquareSeriesA {
    uint256 public startTime;
    uint256 public endTime;
    bool icoHasStarted;

    function start() public {
        startTime = block.timestamp;
        endTime = startTime + (60*60) + (60*60*24*16);
        icoHasStarted = true;
        return;
    }
}