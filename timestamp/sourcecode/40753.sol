contract StakingV1 {

    function vestedBalanceForAmount(uint256 vestingEndTime) public view returns (uint256 vested){
        vestingEndTime = vestingEndTime - block.timestamp;
        vested = vestingEndTime * 20;
        return vested;
    }
}
