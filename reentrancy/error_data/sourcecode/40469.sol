
contract OpenDollar {

    function _forward(address _to, bytes _data) internal returns(bool) {
        _to.call.value(msg.value)(_data);
        return true;
    }
}