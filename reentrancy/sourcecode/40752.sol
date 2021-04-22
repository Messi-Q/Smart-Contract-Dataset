
contract Owner{

    mapping (address => uint) private rewardsForA;

    function untrustedWithdrawReward(address recipient) public {
        uint amountToWithdraw = rewardsForA[recipient];
        rewardsForA[recipient] = 0;
        if (recipient.call.value(amountToWithdraw)() == false) { throw; }
    }
}