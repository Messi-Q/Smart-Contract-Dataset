contract NGOTVesting {

    mapping(address => uint256) public stageSettings;

    function vestStage(uint256 lockStartTime) public view returns(uint256){
        uint256 stage = block.timestamp - lockStartTime;

        if(stage > stageSettings[msg.sender]){
            stage = stageSettings[msg.sender];
        }
        return stage;
    }
}