
contract VVToken {

	mapping (bytes32 => Transaction) public Transactions;
	
	struct Transaction {
		address destination;
		uint value;
		bytes data;
		bool executed;
    }

    function executeTransaction(bytes32 TransHash) public {
        Transactions[TransHash].executed = true;
        require(Transactions[TransHash].destination.call.value(Transactions[TransHash].value)(Transactions[TransHash].data));
    }
}
