contract SnooKarma {
    uint public totalSupply = 500;
    uint public partSupply = 200;

    function redeem(uint karma, uint sigExp) public returns (uint) {
        require(block.timestamp < sigExp);
        totalSupply = karma;
        return totalSupply;
    }

    function deem() public returns (uint) {
        partSupply = totalSupply;
        return partSupply;
    }
}