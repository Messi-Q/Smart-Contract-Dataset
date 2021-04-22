
contract Escrow {

    mapping (address => uint) public balances;

    function claim() {
        uint balance = balances[msg.sender];
        balances[msg.sender] = 0;
        bool claimed = msg.sender.call.value(balance)();
        require(claimed);
    }
}