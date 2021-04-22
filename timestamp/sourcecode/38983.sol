contract FunFairSale {

    uint public deadline;
    uint public capAmount;

    function () payable {
        if (this.balance >= capAmount) throw;
        if (this.balance + msg.value >= capAmount) {
            deadline = block.timestamp;
        }
    }
}