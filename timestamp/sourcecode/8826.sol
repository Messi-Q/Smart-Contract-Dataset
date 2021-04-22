contract TokenOffering {

    uint256 public startTime;
    uint256 public endTime;

    function updateStartTime(uint256 _startTime) public {
        require(_startTime <= endTime);
        require(_startTime >= block.timestamp);
    }
}