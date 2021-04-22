contract PLCRVoting {

    function startPoll(uint _commitDuration, uint _revealDuration) public returns (uint) {
        uint commitEndDate = block.timestamp + (_commitDuration);
        uint revealEndDate = commitEndDate + (_revealDuration);
        return revealEndDate;
    }
}