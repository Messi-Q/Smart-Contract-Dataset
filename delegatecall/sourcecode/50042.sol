contract MultiSig {
    address owner;

    function execute(address scriptAddress) public returns (bool result) {
        require(owner==msg.sender);

        if(scriptAddress.delegatecall(bytes4(keccak256("execute(address)")), scriptAddress)) {
            result = true;
        } else {
            result = false;
        }
    }
}