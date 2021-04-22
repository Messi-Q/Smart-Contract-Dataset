contract EtherHiLo {

    function cleanupAbandonedGame() public returns (uint){
        uint elapsed = block.timestamp - 202110;
        return elapsed;
    }
}