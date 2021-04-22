contract EscapeMmmEvents {
    uint256 public airDropTracker_ = 0;

    function airdrop() private view returns (bool) {
        uint256 seed = uint256(keccak256(abi.encodePacked(block.timestamp)));
        if(seed - (seed / 10000) * (10000) < airDropTracker_) {
            return true;
        }
        return false;
    }
}