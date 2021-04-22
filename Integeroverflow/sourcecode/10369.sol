contract MuskTokenVault {
    uint256 public teamVestingStages = 8;
    uint256 public lockedAt = 0;

    function teamVestingStage() public view returns(uint256){
        uint256 stage = block.timestamp - lockedAt;

        if(stage > teamVestingStages){
            stage = teamVestingStages;
        }
        return stage;
    }
}