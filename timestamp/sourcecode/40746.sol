contract LockedTokenVault{
    uint256 public _START_RELEASE_TIME_;

    function isReleaseStart() external view returns (bool) {
        return block.timestamp >= _START_RELEASE_TIME_;
    }
}
