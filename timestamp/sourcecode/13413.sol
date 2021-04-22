contract PLCRVoting {
    struct Poll {
        uint commitEndDate;      
        uint revealEndDate;      
        uint voteQuorum;	     
        uint votesFor;		     
        uint votesAgainst;
    }

    uint public pollNonce;
    mapping(uint => Poll) public pollMap;
     
    function startPoll(uint _voteQuorum, uint _commitDuration, uint _revealDuration) public returns (uint pollID) {
        uint commitEndDate = block.timestamp + (_commitDuration);
        uint revealEndDate = commitEndDate + (_revealDuration);

        pollMap[pollNonce] = Poll({
            voteQuorum: _voteQuorum,
            commitEndDate: commitEndDate,
            revealEndDate: revealEndDate,
            votesFor: 0,
            votesAgainst: 0
        });
        return pollNonce;
    }
}