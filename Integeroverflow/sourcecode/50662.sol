
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract HiroyukiCoinDark {
    using SafeMath for uint;
    mapping(address => uint256) public balanceOf;

    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        assert(msg.sender.call.value(0)());
        return true;
    }
}
