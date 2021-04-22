contract ArnaVault {
    uint256 amount;
    uint startTime;
    uint period;
    uint256 percent;

    function tokensAvailable() public returns (uint256){
        return ((block.timestamp - startTime) / period + 1) * amount * (percent / 100000);
    }
}