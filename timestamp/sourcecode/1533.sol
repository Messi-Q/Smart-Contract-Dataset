contract AdditionalToken{
    uint256 public maxProportion;
    uint256 public totalSupply;

    mapping(uint256 => uint256) public maxAmountPer;

    function mint(address _to, uint256 _amount) public returns (bool) {
        uint256 curTime = block.timestamp;
        uint256 curTimes = curTime / (31536000);

        if(maxAmountPer[curTimes] == 0) {
            maxAmountPer[curTimes] = totalSupply * (maxProportion) / (100);
        }
        return true;
    }
}
