contract DWBTICO {
    uint8[4] public weekBonuses;
    uint startAt;

    function getWeekNumber() internal view returns (uint8 weekNumber) {
        weekNumber = 0;
        uint time = startAt;
        for (uint8 i = 1; i < weekBonuses.length; i++) {
            time = time + 1 weeks;
            if (block.timestamp <= time) {
                break;
            }
        }
        return;
    }
}