contract ESSENTIA_PE {
    uint256 public pubEnd = 0;
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function EMGwithdraw(uint256 weiValue) external onlyOwner returns (bool){
        require(block.timestamp > pubEnd);           
        require(weiValue > 0);
        return true;
    }
}