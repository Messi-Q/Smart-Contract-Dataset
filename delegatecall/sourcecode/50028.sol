contract Relay {
    address public currentVersion;
    address public owner;

    function changeContract(address newVersion) public {
        require(msg.sender==owner);
        currentVersion = newVersion;
    }

    function transation() {
        if(!currentVersion.delegatecall(msg.data)) throw;
    }
}