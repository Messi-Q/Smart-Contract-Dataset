contract BurnupGameBase {
    uint256[] public activeTimesFrom;

    function canStart() public view returns (bool) {
        uint256 timeOfWeek = (block.timestamp - 345600) % 604800;
        uint256 windows = activeTimesFrom.length;

        for (uint256 i = 0; i < windows; i++) {
            if (timeOfWeek >= activeTimesFrom[i]) {
                return true;
            }
        }
        return false;
    }
}