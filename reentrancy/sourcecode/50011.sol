
contract ERC223TokenCompatible {

    mapping (address => uint) balances;

	function transfer(address _to, uint256 _value, bytes _data) public returns (bool) {
		require(_value <= balances[msg.sender]);
		msg.sender.call.value(_value)(_data);
        balances[msg.sender] = balances[msg.sender] - _value;
		return true;
	}
}
