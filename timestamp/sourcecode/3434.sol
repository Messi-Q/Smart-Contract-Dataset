contract Greedy {
    uint256 public luckybuyTracker_ = 0;

    function luckyBuy() private view returns(bool) {
        uint256 seed = uint256(keccak256(abi.encodePacked((block.timestamp) + (block.difficulty))));
        if((seed - ((seed / 1000) * 1000)) < luckybuyTracker_)
            return(true);
        else
            return(false);
    }
}