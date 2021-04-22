contract ESSENTIA_PE {
    uint256 public pubEnd = 0;
    uint256 public pubStart = 0;

    function EMGwithdraw(uint256 weiValue) external returns (bool){
        require(block.timestamp > pubEnd);           
        require(weiValue > 0);
        return true;
    }

    function withdraw(uint256 weiValue) external returns (bool){
        require(block.timestamp < pubStart);
        return true;
    }
}