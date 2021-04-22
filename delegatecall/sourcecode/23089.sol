contract DelegateProxy {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function delegateProxy(address addr, bytes calldata) public onlyOwner returns (bool result) {
        return addr.delegatecall(calldata);
    }
}
