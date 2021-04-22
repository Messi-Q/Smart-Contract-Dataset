contract UserAuth {
    address public owner;
    address public pendingOwner;
    uint public claimOnwershipTime = 5;

    function setOwner() public {
        require(pendingOwner != address(0));
        require(block.timestamp > claimOnwershipTime);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}
