contract Crowdsale {
    uint256 public STARTDATE = 1533686401;

    function buyTokens() public payable returns (bool) {
        assert(block.timestamp >= STARTDATE);
        return true;
    }
}