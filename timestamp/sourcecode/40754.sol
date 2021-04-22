contract TimeLockedToken {

    uint256 constant LOCK_START = 1595609911;
    uint256 constant FIRST_EPOCH_DELAY = 30 days;
    uint256 constant EPOCH_DURATION = 90 days;
    uint256 constant TOTAL_EPOCHS = 8;

    function epochsPassed() public view returns (uint256) {
        uint256 timePassed = block.timestamp - LOCK_START;
        if (timePassed < FIRST_EPOCH_DELAY) {
            return 0;
        }
        uint256 totalEpochsPassed =(timePassed-FIRST_EPOCH_DELAY)/(EPOCH_DURATION);
        if (totalEpochsPassed > TOTAL_EPOCHS) {
            return TOTAL_EPOCHS;
        }
        return totalEpochsPassed;
    }

}
