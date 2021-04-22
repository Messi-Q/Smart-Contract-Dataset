contract ExpiringMarket{

    function getTime() constant returns (uint) {
        return block.timestamp;
    }
}