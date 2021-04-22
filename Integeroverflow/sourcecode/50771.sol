
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract DividendToken {
    using SafeMath for uint;
    mapping (address => uint) creditedPoints;
    uint dividendsCollected;

    function collectOwedDividends() public returns (uint amount) {
        amount = creditedPoints[msg.sender] / 100;
        creditedPoints[msg.sender] = creditedPoints[msg.sender].sub(amount);
        require(msg.sender.call.value(amount)());
        dividendsCollected = dividendsCollected.add(amount);
        return dividendsCollected;
    }
}
