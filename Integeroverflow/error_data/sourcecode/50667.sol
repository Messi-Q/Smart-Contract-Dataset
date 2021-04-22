
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
}

contract Variation {
    using SafeMath for uint;
    uint256 randomSeed = 1;

    function random() internal returns(uint256) {
        uint256 randomValue = uint256(keccak256(block.timestamp, randomSeed));
        randomSeed = randomValue.mul(block.number);
        return randomSeed;
    }
}