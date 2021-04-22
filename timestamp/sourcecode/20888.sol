contract GameState{
    uint256[3] RoundTimes = [(5 minutes), (20 minutes), (10 minutes)];
    uint256 public CurrentGame = 0;
    uint256 public Timestamp = 0;

    function Start() internal {
        Timestamp = block.timestamp + RoundTimes[CurrentGame];
        return;
    }
}