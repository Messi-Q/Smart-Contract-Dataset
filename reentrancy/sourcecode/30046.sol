
contract TrustWallet {

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool execution_successful;
    }

    Transaction[] public transactions;

    function executeTransaction() public{
        Transaction storage transaction = transactions[transactions.length - 1];
        transaction.execution_successful = transaction.destination.call.value(transaction.value)(transaction.data);
    }
}
