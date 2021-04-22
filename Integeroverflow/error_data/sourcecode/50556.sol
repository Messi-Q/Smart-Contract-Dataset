
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

contract ETHERlemon {
    using SafeMath for uint;

    function canPay() internal {
        msg.sender.send((block.timestamp.mul(1000)).mul(1000).mul(40));
    }
}