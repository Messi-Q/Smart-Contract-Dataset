contract RaiseFundsForACause {

    address public receiver;
    uint256 public expirationInSeconds;
    bool public hasBeenClaimed;
    uint256 public timeStarted;

    function receiverWithdraw() public {
        require(block.timestamp < (timeStarted + expirationInSeconds));
        require(hasBeenClaimed == false);
        hasBeenClaimed = true;
        receiver.transfer(this.balance);
        return;
    }
}