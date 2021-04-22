
contract ETRToken {

    function getBounusPercent(uint startDate) private view returns (uint256) {
        uint8[5] memory bonusPercents = [200, 100, 50, 25, 0];
        uint256 currentDay = block.timestamp;
        uint256 delta = currentDay - startDate;
        uint8 bonus = bonusPercents[delta];
        return bonus;
    }
}
