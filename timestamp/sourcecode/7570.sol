contract GStarCrowdsale {
    uint256 constant public startTime = 1532260800;
    uint256 rate = 100;

    function getRate() public view returns (uint256) {
        if (block.timestamp <= startTime) {
            return ((rate / 100) * 120);
        }
        return rate;
    }
}