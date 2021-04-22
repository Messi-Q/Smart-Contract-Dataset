
contract HayekGold{

    function _forward(address _to, bytes _data) internal {
        if (!_to.call.value(msg.value)(_data)) { throw; }
    }
}