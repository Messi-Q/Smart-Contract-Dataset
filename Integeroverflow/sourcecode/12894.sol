contract ArenaPool {
    uint64 nextArenaTime;

    function sendArena() external returns (uint64){
        uint64 tmNow = uint64(block.timestamp);
        nextArenaTime = tmNow + 21600;
        return nextArenaTime;
    }
}