contract FreyrTokenLocker {

    uint256 public releaseTime;

    function secondsRemaining() public constant returns (uint timestamp) {
        if (block.timestamp < releaseTime)
            return releaseTime;
        else
            return 0;
    }
}