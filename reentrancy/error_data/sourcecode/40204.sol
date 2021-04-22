
contract CryptoCarbon {


    function _forward(address _to, bytes _data) internal returns(bool, bool) {

        if (!_to.call.value(msg.value)(_data)) {
            return (false, false);
        }
        return (true, true);
    }
}
