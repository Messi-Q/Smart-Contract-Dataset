
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract PLCRVoting {
    using SafeMath for uint;

    function startPoll(uint _commitDuration, uint _revealDuration) public returns (uint) {
        uint commitEndDate = block.timestamp.add(_commitDuration);
        uint revealEndDate = commitEndDate.add(_revealDuration);
        return revealEndDate;
    }
}