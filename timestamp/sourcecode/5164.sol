contract Lock {

    mapping(address => uint256) public teamLockTime;

    function teamAvailable(address _to) internal constant returns (uint256) {

        uint256 now1 = block.timestamp;
        uint256 lockTime = teamLockTime[_to];
        uint256 time = now1 - (lockTime);
        uint256 percent = 0;

        if(time >= 365 days) {
           percent = (time / (30 days)) + (1);
        }

        uint256 avail = avail * (percent) / (12) ;
        return avail;
    }
}