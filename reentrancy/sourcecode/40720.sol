
contract Wallet {
     
    function execute(address _to, uint _value, bytes _data) external returns (uint) {
        if (_value > 0) {
            _to.call.value(_value)(_data);
            return 0;
        }
    }
}