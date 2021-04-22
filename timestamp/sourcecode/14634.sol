contract MSCE {
    uint256 public crowdsaleEndTime = 1526831999;
    uint256 public crowdsaleTotal = 2000*40000*(10**18);

    function () internal payable{
        uint256 currentTime;
        require(currentTime < block.timestamp);
        require(crowdsaleTotal > 0);
        return;
    }
}