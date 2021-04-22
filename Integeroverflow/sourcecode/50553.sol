
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Bittwatt {
    using SafeMath for uint;

    function createDate(uint _minutes, uint _seconds) public view returns (uint) {
        uint currentTimestamp = block.timestamp;
        currentTimestamp = currentTimestamp.add(_seconds);
        currentTimestamp = currentTimestamp.add(_minutes.mul(60));
        return currentTimestamp;
    }
}