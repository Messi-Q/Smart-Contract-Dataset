contract Test {
    uint256 public constant maxPreIcoTokens = 100000000 ether;
    uint256 public dateStart = 1511987870;
    uint256 public rateBase = 35000;
    uint256 public totalSupply;

    function buyPreIcoTokens(uint256 _weiAmount) internal returns(uint256){
        uint8 percents = 0;
        if(block.timestamp - dateStart <= 10 days){
            percents = 20;
        }
        uint256 tokens = _weiAmount * (rateBase) * (2);
        if(percents > 0){
            tokens = tokens + (tokens * (percents) / (100));
        }
        require(totalSupply + (tokens) <= maxPreIcoTokens);
        return tokens;
    }
}