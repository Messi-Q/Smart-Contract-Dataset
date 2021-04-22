contract SafeMath1 {
    function time() public constant returns (uint256) {
        return block.timestamp;
    }
}