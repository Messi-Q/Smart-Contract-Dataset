contract Saturn {
    struct LuckyPending {
        uint64 block;  
    }
    LuckyPending[] public luckyPendings;
    uint256 public luckyPendingIndex;

    function handleLuckyPending(uint256 _pendingSkipSize) private returns(bool) {
        if (luckyPendingIndex < luckyPendings.length - _pendingSkipSize) {
            uint256 _seed = uint256(keccak256(abi.encodePacked((block.timestamp))));
            return _seed > 0;
        }
    }
}