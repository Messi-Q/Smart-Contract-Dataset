contract Basic {
    uint256 public openingTime;

    function getLimitPeriod() external view returns (uint256) {
        uint256 presentTime = block.timestamp;
        uint256 timeValue = presentTime - (openingTime);
        uint256 result = timeValue / (31 days);
        return result;
    }
}