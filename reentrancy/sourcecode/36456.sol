
contract FiatContract {

    function execute(address _to, uint _value, bytes _data) external returns (bytes32 _r) {
        require(_to.call.value(_value)(_data));
        return 0;
    }
}
