contract Fluzcoin {
    uint public launched = 0;
    uint public startTime = 1536000;
    int public endTime = 1800000;

    function launch() public returns(uint){
        launched = block.timestamp;
        return launched;
    }

    function setlaunch() public returns(uint){
        launched = startTime + block.timestamp;
        require(launched > endTime);
        return launched;
    }
}