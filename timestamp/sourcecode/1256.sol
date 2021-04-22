contract Betting {
    struct chronus_info {
        uint32  starting_time;
        uint32  betting_duration;
        uint32  race_duration;  
    }
    chronus_info public chronus;
    address public owner;
     
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
    function setupRace(uint32 _bettingDuration, uint32 _raceDuration) onlyOwner external payable returns (uint32) {
        chronus.starting_time = uint32(block.timestamp);
        chronus.betting_duration = _bettingDuration;
        chronus.race_duration = _raceDuration;
        return chronus.starting_time;
    }
}