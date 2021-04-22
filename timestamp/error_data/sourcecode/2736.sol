contract TimedStateMachine {
    mapping(bytes32 => uint256) private startTime;
    function hasStartTimePassed(bytes32 _stateId) internal returns(bool) {
        return startTime[_stateId] <= block.timestamp;
    }
}