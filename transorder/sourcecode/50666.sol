contract PLCRVoting {
    uint public commitEndDate;

    function startPoll(uint _commitDuration, uint _revealDuration) public returns (uint) {
        commitEndDate = block.timestamp + _commitDuration;
        uint revealEndDate = commitEndDate + _revealDuration;
        return revealEndDate;
    }

     function endPoll(uint _commitDuration, uint _revealDuration) public returns (uint) {
        commitEndDate = block.timestamp - _commitDuration;
        uint revealEndDate = commitEndDate - _revealDuration;
        return revealEndDate;
    }
}