contract JobsBounty {
    address public owner;
    uint public endDate = 0;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdrawERC20Token() external onlyOwner returns(bool){
        assert(block.timestamp >= endDate);
        return true;
    }
}