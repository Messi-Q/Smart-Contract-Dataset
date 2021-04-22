contract AqwireToken {
    uint256 public unlockTime;

    function transfer() public returns (bool) {
        require(block.timestamp >= unlockTime);
        return true;
    }
}