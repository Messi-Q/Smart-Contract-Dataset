contract Relay {
    address public currentVersion;
    address public owner;

    modifier onlyOwner() {
        if (msg.sender != owner) { throw; }
        _;
    }
    function changeContract(address newVersion) public onlyOwner {
        currentVersion = newVersion;
    }

    function transation() {
        if(!currentVersion.delegatecall(msg.data)) throw;
    }
}