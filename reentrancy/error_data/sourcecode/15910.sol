
contract CarefulTransfer {

    function carefulSendWithFixedGas(address _toAddress, uint _valueWei, uint _extraGasIncluded) internal returns (bool success) {
        return _toAddress.call.value(_valueWei).gas(_extraGasIncluded)();
    }
}
