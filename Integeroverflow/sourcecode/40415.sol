
contract EtherDelta {

    mapping (address => mapping (address => uint)) tokens;

    function withdraw(uint amount) {
        if (!msg.sender.call.value(amount)()) throw;
        tokens[0][msg.sender] -= amount;
    }
}
