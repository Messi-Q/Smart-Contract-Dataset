
contract Attack {

    address victim;

    function step1(uint256 amount) payable {
        if (this.balance >= amount) {
            victim.call.value(amount)();
        }
    }
}
