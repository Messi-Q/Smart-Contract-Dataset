
contract EthTxOrderDependenceMinimal {
    address public owner;
    uint public reward;

    function setReward() public payable {
        require(msg.sender == owner);
        owner.transfer(reward);
        reward = msg.value;
    }

    function claimReward(uint256 submission) {
        require(submission < 10);
        msg.sender.transfer(reward);
    }
}