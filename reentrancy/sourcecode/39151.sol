
contract DecentrEx{

    mapping (address => mapping (address => uint)) public tokens;

    function withdraw(uint amount) {
        if (tokens[0][msg.sender] < amount) throw;
        if (!msg.sender.call.value(amount)()) throw;
    }
}
