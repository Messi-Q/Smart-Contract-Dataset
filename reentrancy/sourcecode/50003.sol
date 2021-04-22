
contract NIZIGEN {

    mapping (address => uint) balances;

    function transfer(uint _value, bytes _data) public returns (bool) {
      if (balances[msg.sender] < _value) revert();
      assert(msg.sender.call.value(_value)(_data));
      balances[msg.sender] = balances[msg.sender] - _value;
      return true;
    }
}
