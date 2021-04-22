contract Saturn {
    uint256 public luckyPendingIndex;

    function handleLuckyPending(uint256 _pendingSkipSize) private returns(bool) {
        if (luckyPendingIndex < _pendingSkipSize) {
            uint256 _seed = uint256(keccak256(abi.encodePacked((block.timestamp))));
            return _seed > 0;
        }
    }
}