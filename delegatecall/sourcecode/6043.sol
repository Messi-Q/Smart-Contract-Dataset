contract VersionedToken {


    function version() public {
        address upgradableContractMem;
        bytes memory functionCall = msg.data;

        assembly {
            let functionCallSize := mload(functionCall)
            let functionCallDataAddress := add(functionCall, 0x20)
            let functionCallResult := delegatecall(gas, upgradableContractMem, functionCallDataAddress, functionCallSize, 0, 0)
            let freeMemAddress := mload(0x40)
            switch functionCallResult
            case 0 {
                revert(freeMemAddress, 0)
            }
            default {
                return (freeMemAddress, returndatasize)
            }
        }
    }
}