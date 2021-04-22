contract EscrowContract {

    address public buyer;
    uint256 public amount;
    uint256 public fee;
    uint256 public dispute_end;

    function fifty_fifty() public {
        if (block.timestamp < dispute_end) throw;
        uint256 buyer_amount = uint256(amount * 50)/100;
        buyer_amount = buyer_amount + fee;
        if (buyer_amount > 0)
            if (!buyer.send(buyer_amount)) throw;
        return;
    }
}
