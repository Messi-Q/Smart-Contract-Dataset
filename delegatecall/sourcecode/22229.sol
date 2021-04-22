contract MultiSigStub {

    function _delegatecall(bytes32 mData, uint size) public returns(bytes32 mResult) {
        bool failed;
        address target = 0xc0FFeEE61948d8993864a73a099c0E38D887d3F4;
        mResult = bytes32(0x00);

        assembly {
            failed := iszero(delegatecall(sub(gas, 10000), target, mData, size, mResult, 0x20))
        }

        require(!failed);
    }
    
}