
contract MultiSigWallet {

    mapping (uint => Transaction) public transactions;

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
    }

    function executeTransaction(uint transactionId) public {
        if (transactionId > 0) {
            Transaction tx = transactions[transactionId];
            tx.executed = true;

            if (tx.destination.call.value(tx.value)(tx.data))
                return;
            else {
                tx.executed = false;
            }
        }
    }
}
