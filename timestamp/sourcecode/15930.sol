contract SophosToken {
    uint public constant ALLOCATION_LOCK_END_TIMESTAMP = 1572566400;

    function inAllocationLockPeriod() constant returns (bool) {
        return (block.timestamp < ALLOCATION_LOCK_END_TIMESTAMP);
    }
}