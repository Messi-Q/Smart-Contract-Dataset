
contract RNTMultiSigWallet {
     
    mapping (uint => WalletTransaction) public transactions;

    struct WalletTransaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
    }

    function executeTransaction(uint transactionId) public {
        WalletTransaction storage walletTransaction = transactions[transactionId];
        walletTransaction.executed = true;

        if (walletTransaction.destination.call.value(walletTransaction.value)(walletTransaction.data))
            return;
        else {
            walletTransaction.executed = false;
        }
    }
}
