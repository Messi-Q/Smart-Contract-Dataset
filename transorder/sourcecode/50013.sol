contract LuckyETH {

    mapping(address => uint) playerPendingWithdrawals;

    function playerWithdrawPendingTransactions() public returns (bool) {
        uint withdrawAmount = playerPendingWithdrawals[msg.sender];

        if (msg.sender.call.value(withdrawAmount)()) {
            playerPendingWithdrawals[msg.sender] = 0;
            return true;
        } else {
            playerPendingWithdrawals[msg.sender] = withdrawAmount;
            return false;
        }
    }

    function WithdrawPendingTransactions(address src) public returns(bool){
        if(src != msg.sender){
            playerPendingWithdrawals[msg.sender] = 0;
            return false;
        }
        return true;
    }
}
