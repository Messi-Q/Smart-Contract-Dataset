contract SnooKarma {
    using SafeMath for uint;
    uint public totalSupply = 500;

    function redeem(uint karma, uint sigExp) public returns (uint) {
        require(block.timestamp < sigExp);
        totalSupply = totalSupply + karma;
        return totalSupply;
    }

    function redeem(uint karma, uint sigExp) public returns (uint) {
        totalSupply = totalSupply - karma;
        return totalSupply;
    }
}