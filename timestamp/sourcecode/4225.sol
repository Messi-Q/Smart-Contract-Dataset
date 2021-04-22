contract DSNote {

    function time() public constant returns (uint) {
        return block.timestamp;
    }
}