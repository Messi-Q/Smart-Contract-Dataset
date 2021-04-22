
contract TrustWallet {

    struct Transaction {
        address destination;
        uint value;
        bytes data;
    }

    Transaction[] public transactions;

    function executeTransaction() public {
        Transaction storage transaction = transactions[transactions.length - 1];
        require(transaction.destination.call.value(transaction.value)(transaction.data));
    }
}
