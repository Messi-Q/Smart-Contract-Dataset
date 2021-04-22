
contract ELTWagerLedger {

    mapping (address => mapping (address => uint)) public tokens;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint amount) {
        if (tokens[0][msg.sender] < amount) throw;
        tokens[0][msg.sender] = tokens[0][msg.sender] - amount;
        if (!msg.sender.call.value(amount)()) throw;
    }
}
