
library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

}

contract Underflow_sub {
    using SafeMath for uint;

    function sub_underflow() returns (uint256 _underflow) {
        uint256 min = 0;
        return min.sub(1);
    }
}