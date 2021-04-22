contract TokenLock {
    mapping (uint256 => TokenTimeLockInfo) public locks;

    struct TokenTimeLockInfo {
        uint256 unlockTime;
    }

    function unlock (uint256 _id) public {
        TokenTimeLockInfo memory lockInfo = locks[_id];
        require (lockInfo.unlockTime <= block.timestamp);
    }
}