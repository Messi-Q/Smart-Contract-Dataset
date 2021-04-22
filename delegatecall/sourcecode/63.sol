contract TUINETWORK {

    uint public constant ALLOCATION_LOCK_END_TIMESTAMP = 1559347200;

    function inAllocationLockPeriod() constant returns (bool) {
        return (block.timestamp < ALLOCATION_LOCK_END_TIMESTAMP);
    }
}