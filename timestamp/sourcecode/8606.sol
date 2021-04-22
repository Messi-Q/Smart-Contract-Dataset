contract YunMint {
    uint    public cycleCount = 0;
    uint256 public firstReleaseAmount;
    uint256 public createTime = 0;

    function YunMin(address _operator) public returns(uint256){
        createTime = block.timestamp;
        cycleCount = createTime;
        firstReleaseAmount = 200000 * (10 ** 8);
        return firstReleaseAmount + cycleCount;
    }
}