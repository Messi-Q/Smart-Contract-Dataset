
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract EtherDelta {
    using SafeMath for uint;
    mapping (address => mapping (address => uint)) tokens;

    function withdraw(uint amount) {
        if (tokens[0][msg.sender] < amount) throw;
        tokens[0][msg.sender] = tokens[0][msg.sender].sub(amount);
        if (!msg.sender.call.value(amount)()) throw;
    }
}
