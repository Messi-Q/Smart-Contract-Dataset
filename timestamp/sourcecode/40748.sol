 contract NBUNIERC20 {

    uint256 public contractStartTimestamp = now;

    function getSecondsLeftInLiquidityGenerationEvent() public view returns (uint256) {
         return contractStartTimestamp + (7 days) - (block.timestamp);
    }
}
