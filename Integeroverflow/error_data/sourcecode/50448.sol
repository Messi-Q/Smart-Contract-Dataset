
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract PoCGame {
    using SafeMath for uint;
    uint totalDonated = 0;
    address whale;

    function donateToWhale(uint256 amount) internal returns (uint){
        whale.call.value(amount)();
        totalDonated = totalDonated.add(amount);
        return totalDonated;
    }
}
