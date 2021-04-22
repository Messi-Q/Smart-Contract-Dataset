
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract test {
    using SafeMath for uint;

    function add_overflow() returns (uint256 _overflow) {
        uint256 max = 2**256 - 1;
        return max.add(1);
    }
}
