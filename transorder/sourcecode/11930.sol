contract Fluzcoin {
    uint public launched = 0;
    uint public startTime = 1536000;
    int public endTime = 1800000;

    function launch() public returns(uint){
        launched = block.timestamp;
        return launched;
    }

    function getTime() public returns(uint){
        require(block.timestamp < endTime);
        endTime = startTime + block.timestamp;
        return endTime;
    }
}