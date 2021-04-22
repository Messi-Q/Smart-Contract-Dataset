
contract Owner{
    mapping (address => uint) private rewardsForA;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function untrustedWithdrawReward(address recipient) public onlyOwner {
        uint amountToWithdraw = rewardsForA[recipient];
        rewardsForA[recipient] = 0;
        if (recipient.call.value(amountToWithdraw)() == false) { throw; }
    }
}