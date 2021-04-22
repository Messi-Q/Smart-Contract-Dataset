
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract SnooKarma {
    using SafeMath for uint;
    uint public totalSupply = 500;

    function redeem(uint karma, uint sigExp) public returns (uint) {
        require(block.timestamp < sigExp);
        totalSupply = totalSupply.add(karma);
        return totalSupply;
    }
}