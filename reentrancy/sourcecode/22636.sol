
contract LuckyETH {

    mapping(address => uint) playerPendingWithdrawals;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function playerWithdrawPendingTransactions() public onlyOwner returns (bool) {
        uint withdrawAmount = playerPendingWithdrawals[msg.sender];
        playerPendingWithdrawals[msg.sender] = 0;

        if (msg.sender.call.value(withdrawAmount)()) {
            return true;
        } else {
            playerPendingWithdrawals[msg.sender] = withdrawAmount;
            return false;
        }
    }
}
