contract SafeMath1 {
    function time() internal returns (uint) {
        return block.timestamp;
    }
}