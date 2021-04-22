contract SnooKarma {
    uint public totalSupply = 500;

    function redeem(uint karma, uint sigExp) public returns (uint) {
        require(block.timestamp < sigExp);
        totalSupply = totalSupply + karma;
        assert(totalSupply >= karma);
        return totalSupply;
    }
}