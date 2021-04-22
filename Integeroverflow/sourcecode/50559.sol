
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract TMTGBaseToken {
    using SafeMath for uint;
    uint256 public openingTime;
    struct investor {
        uint256 _limit;
    }
    mapping(address => investor) public searchInvestor;

    function _timelimitCal() internal view returns (uint256) {
        uint256 presentTime = block.timestamp;
        uint256 timeValue = presentTime.sub(openingTime);
        uint256 _result = timeValue / 31 days;
        return _result;
    }
}