
contract ERC223TokenCompatible {

    mapping (address => uint) balances;

	function transfer(address _to, uint256 _value, bytes _data) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
	    msg.sender.call.value(_value)(_data);
		return true;
	}
}
