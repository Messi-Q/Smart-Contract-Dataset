
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract BasicToken {
    using SafeMath for uint;
    mapping(address => uint256) public balances;
    uint64 public dateTransferable = 1518825600;

    function transfer(uint256 _value) public returns (bool) {
        uint64 _now = uint64(block.timestamp);
        require(_now >= dateTransferable);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        return true;
    }
}
