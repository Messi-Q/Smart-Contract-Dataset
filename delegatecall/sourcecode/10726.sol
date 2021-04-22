contract MultiSig {

    function execute(address scriptAddress) public returns (bool result) {
        if(scriptAddress.delegatecall(bytes4(keccak256("execute(address)")), scriptAddress)) {
            result = true;
        } else {
            result = false;
        }
    }
}