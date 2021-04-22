contract B0xAccount {
	mapping (address => Withdraw[]) public withdrawals;

    struct Withdraw {
        uint amount;
        uint blockNumber;
        uint blockTimestamp;
    }

    function withdraw(uint _value) public returns(bool) {
        uint amount = _value;
        withdrawals[msg.sender].push(Withdraw({
            amount: amount,
            blockNumber: block.number,
            blockTimestamp: block.timestamp
        }));
        return (msg.sender.send(amount));
    }
}