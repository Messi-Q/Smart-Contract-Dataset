
contract generic_holder {

    function execute(address _to, uint _value, bytes _data) external returns (bool){
        return _to.call.value(_value)(_data);
    }
}
