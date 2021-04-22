contract AdditionalToken{
    uint256 public totalSupply = 1999;

    mapping(uint256 => uint256) public maxAmountPer;

    function mint(uint256 _amount) public returns (bool) {
        uint256 curTime = block.timestamp;
        uint256 curTimes = curTime / 31536000;

        if(maxAmountPer[curTimes] == 0) {
            maxAmountPer[curTimes] = totalSupply * _amount / 100;
        }
        return true;
    }
}
