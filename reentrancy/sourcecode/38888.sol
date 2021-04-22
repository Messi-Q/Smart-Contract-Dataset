
contract FunFairSale {

    address public owner;

    function withdraw() {
        if (!owner.call.value(this.balance)()) throw;
    }
}
