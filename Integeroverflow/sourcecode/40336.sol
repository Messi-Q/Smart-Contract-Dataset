
contract EtherDelta {

    mapping (address => mapping (address => uint)) tokens;

    function withdraw(uint amount) {
        tokens[0][msg.sender] = tokens[0][msg.sender] - amount;
        if (!msg.sender.call.value(amount)()) throw;
    }
}
