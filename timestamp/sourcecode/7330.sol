contract KcashVesting {
    uint256 public lockStartTime;

    mapping(address => uint256) public stageSettings;
    mapping(address => uint256) public timeLockDurations;

    function vestStage() public view returns(uint256){
        uint256 vestingMonths = 100;
        uint256 stage = (block.timestamp - (lockStartTime)) / (vestingMonths);
        if(stage > stageSettings[msg.sender]){
            stage = stageSettings[msg.sender];
        }
        return stage;
    }
}