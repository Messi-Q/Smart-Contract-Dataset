
contract FunFairSale {

    uint public deadline = 1499436000;
    address public owner;

    function withdraw() {
        if (block.timestamp < deadline) throw;
        if (!owner.call.value(this.balance)()) throw;
    }
}
