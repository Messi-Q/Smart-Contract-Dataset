contract TimedStateMachine {
    event LogSetStageStartTime(bytes32 indexed stageId, uint256 startTime);
    mapping(bytes32 => uint256) internal startTime;

    function setStageStartTime(bytes32 stageId, uint256 timestamp) internal {
        require(timestamp > block.timestamp);
        startTime[stageId] = timestamp;
        LogSetStageStartTime(stageId, timestamp);
        return;
    }
}