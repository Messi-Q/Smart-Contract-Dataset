
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

contract ERC223TokenCompatible {
    using SafeMath for uint;
    mapping (address => uint) balances;

	function transfer(address _to, uint256 _value, bytes _data) public returns (bool success) {
		require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
	    msg.sender.call.value(_value)(_data);
		return true;
	}
}
