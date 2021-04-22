
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract BitSongCrowdsale {
    using SafeMath for uint;
    uint256 public openingTime;
    uint256 public closingTime;
    uint256 public duration;

    function startDistribution() external returns (uint256) {
        openingTime = block.timestamp;
        closingTime = openingTime.add(duration);
        return closingTime;
    }
}