contract ESSENTIA_PE {
    uint256 public pubEnd = 0;

    function EMGwithdraw(uint256 weiValue) external returns (bool){
        require(block.timestamp > pubEnd);           
        require(weiValue > 0);
        return true;
    }
}