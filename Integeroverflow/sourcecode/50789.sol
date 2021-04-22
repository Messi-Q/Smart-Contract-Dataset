
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract PPBC_API {
    using SafeMath for uint;
    uint256 private lastBlock;
    uint256 private lastRandom;
    uint cnt;

    function createRandomNumber() returns (uint256) {

        for (cnt = 0; cnt < lastRandom % 5; cnt++){
            lastBlock = lastBlock.sub(block.timestamp);
        }
        return lastBlock;
    }
}