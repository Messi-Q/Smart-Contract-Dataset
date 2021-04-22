contract FoMoJP {
    uint256 public airDropTracker_ = 0;

    function airdrop() private view returns(bool) {
        uint256 seed = uint256(keccak256(abi.encodePacked((block.timestamp) / now )));
        if((seed - ((seed / 1000) * 1000)) < airDropTracker_)
            return true;
        else
            return false;
    }
}