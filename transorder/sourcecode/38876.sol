contract FunFairSale {

    uint public deadline = 1499436000;

    function withdraw() {
        if (block.timestamp < deadline) throw;
        if (!owner.call.value(this.balance)()) throw;
    }
}
