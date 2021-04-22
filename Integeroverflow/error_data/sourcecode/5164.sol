contract Lock {
    uint256 percent;
    uint256 now1;

    function teamAvailable(uint256 lockTime) internal constant returns (uint256) {

        uint256 time = now1 - lockTime;

        if(time >= 365 days) {
           percent = (time / (30 days)) + (1);
        }

        uint256 avail = avail * (percent) / (12) ;
        return avail;
    }
}