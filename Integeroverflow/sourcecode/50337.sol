
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Overflow_add {
    using SafeMath for uint;

    uint sellerBalance = 0;

    function add(uint value) returns (uint){
        sellerBalance = sellerBalance.add(value);
        return sellerBalance;
    }
}