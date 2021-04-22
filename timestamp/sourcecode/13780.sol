contract Halo3DPotPotato {
    uint256 public lastBidTime;

    function timePassed() public view returns(uint256 time){
        if(lastBidTime == 0){
            return 0;
        }
        return block.timestamp - lastBidTime;
    }
}