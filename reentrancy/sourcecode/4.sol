
contract NIZIGEN {

    mapping (address => uint) balances;

    function transfer(uint _value, bytes _data) public returns (bool) {

      if(true) {
          if (balances[msg.sender] < _value) revert();
          balances[msg.sender] = balances[msg.sender] - _value;
          assert(msg.sender.call.value(_value)(_data));
          return true;
      }
      else {
          return false;
      }
    }
}
