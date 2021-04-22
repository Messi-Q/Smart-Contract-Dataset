contract Tokenlock {
    uint256 public interval;
    uint256 public releaseTime;

    function start() external returns (uint256){
        uint time = block.timestamp;
        releaseTime = time + interval;
        return releaseTime;
    }
}