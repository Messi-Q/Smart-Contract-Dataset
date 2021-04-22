contract DSNote {
    function time() constant returns (uint) {
        return block.timestamp;
    }
}