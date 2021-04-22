contract MuskTokenVault {
    uint256 public teamTimeLock = 2 * 365 days;
    uint256 public teamVestingStages = 8;
    uint256 public lockedAt = 0;

    function teamVestingStage() public view returns(uint256){
        uint256 vestingMonths = teamTimeLock / (teamVestingStages);
        uint256 stage = (block.timestamp - (lockedAt)) / (vestingMonths);
        if(stage > teamVestingStages){
            stage = teamVestingStages;
        }
        return stage;
    }
}