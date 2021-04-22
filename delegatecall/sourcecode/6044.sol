contract VToken {

    function version() public {
        address upgradableContractMem;
        bytes memory functionCall = msg.data;

        assembly {
            let functionCallSize := mload(functionCall)
            let functionCallDataAddress := add(functionCall, 0x20)
            let functionCallResult := delegatecall(gas, upgradableContractMem, functionCallDataAddress, functionCallSize, 0, 0)
        }
    }
}