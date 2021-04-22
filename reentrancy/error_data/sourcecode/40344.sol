
contract CarefulSenderMixin {
    function carefulSendWithFixedGas(address _toAddress, uint _valueWei, uint _extraGasIncluded) internal returns (bool) {
        return _toAddress.call.value(_valueWei).gas(_extraGasIncluded)();
    }
}
