contract BlockportCrowdsale {

    uint256 public startTime;

    function setCrowdsaleDates(uint256 _startTime, uint256 _endTime) public returns (bool) {
        require(startTime > block.timestamp);
        startTime = _startTime;
        return true;
    }
}