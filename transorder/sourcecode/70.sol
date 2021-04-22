contract ShortingRewards{
    uint256 public rewardRate = 2;
    uint256 public periodFinish = 0;

    function notifyRewardAmount(uint256 reward) public {
        if (block.timestamp >= periodFinish) {
            rewardRate = reward;
        } else {
            rewardRate = 100;
        }
    }
}
