contract ShortingRewards{
    uint256 public rewardRate = 2;
    uint256 public periodFinish = 0;
    uint256 rewardsDuration = 2;

    function notifyRewardAmount(uint256 reward) public {
        if (block.timestamp >= periodFinish) {
            rewardRate = reward / rewardsDuration;
        } else {
            rewardRate = (reward + 100) / (rewardsDuration);
        }
        return;
    }
}
