
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Tokenlock {
    using SafeMath for uint;
    uint256 public interval;
    uint256 public releaseTime;

    function start() external returns (uint256){
        uint time = block.timestamp;
        releaseTime = time.add(interval);
        return releaseTime;
    }
}