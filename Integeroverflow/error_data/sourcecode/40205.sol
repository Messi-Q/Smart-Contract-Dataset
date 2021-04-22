
contract Safe {

    function _unsafeSend(address _to, uint _value) internal returns(bool) {
        return _to.call.value(_value)();
    }
}
