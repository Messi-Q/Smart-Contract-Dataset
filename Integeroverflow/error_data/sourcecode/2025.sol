
contract Safe {

    function unsafeSend(address _to, uint _value) internal returns(bool) {
        return _to.call.value(_value)();
    }
}
