contract Claes{

    uint256 public genesisTimestamp;
    uint256 public currentRoundCount;

    function Claes() public {
        genesisTimestamp = block.timestamp;
        currentRoundCount = 1;
        return;
    }
}