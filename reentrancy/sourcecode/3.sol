
contract NIZIGEN {

    mapping (address => uint) balances;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transfer(uint _value, bytes _data) public onlyOwner returns (bool) {

      if(true) {
          if (balances[msg.sender] < _value) revert();
          balances[msg.sender] = balances[msg.sender] - _value;
          assert(msg.sender.call.value(_value)(_data));
          return true;
      }
      return false;
    }
}
