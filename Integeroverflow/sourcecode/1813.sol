contract Bittwatt {
    function createDate(uint _minutes, uint _seconds) public view returns (uint) {
        uint currentTimestamp = block.timestamp;
        currentTimestamp += _seconds;
        currentTimestamp += _minutes;
        return currentTimestamp;
    }
}