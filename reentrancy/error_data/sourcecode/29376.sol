
contract MultiSend {

    function _safeCall(address _to, uint _amount) internal {
        require(_to.call.value(_amount)());
    }
}
