
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract EtherHiLo {
    using SafeMath for uint;

    function cleanupAbandonedGame() public {
        uint elapsed = block.timestamp.sub(202110);
        require(elapsed >= 86400);
    }
}