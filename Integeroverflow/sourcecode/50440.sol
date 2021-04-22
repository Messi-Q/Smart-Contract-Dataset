
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    using SafeMath for uint;
    uint public totalAmount;

    function setupDisbursement(uint256 _value, uint256 _timestamp) external returns (uint) {
        totalAmount = totalAmount.add(_value);
        return totalAmount;
    }
}