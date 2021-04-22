contract myTime {

    function getBlockTime() constant returns (uint) {
        return block.timestamp;
    }
}