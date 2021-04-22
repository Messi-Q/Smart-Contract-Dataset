contract ShareXTokenVault {

    mapping(address => uint256) public allocations;
    mapping(address => uint256) public timeLocks;
    mapping(address => uint256) public claimed;
     
    modifier onlyOwner {
        require(allocations[msg.sender] > 0);
        _;
    }

    function canCollect() public view onlyOwner returns(bool) {
        return block.timestamp > timeLocks[msg.sender] && claimed[msg.sender] == 0;
    }
}