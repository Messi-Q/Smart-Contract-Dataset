
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

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

contract ProgressiveIndividualCappedCrowdsale {
    using SafeMath for uint;
    uint public startGeneralSale;
    uint public constant TIME_PERIOD_IN_SEC = 1 days;
    uint256 public baseEthCapPerAddress;

    function getCurrentEthCapPerAddress() public constant returns(uint) {
        uint time = block.timestamp;
        uint timeSinceStartInSec = time.sub(startGeneralSale);
        uint currentPeriod = (timeSinceStartInSec / (TIME_PERIOD_IN_SEC)).add(1);
        return currentPeriod.mul(2);
    }
}
