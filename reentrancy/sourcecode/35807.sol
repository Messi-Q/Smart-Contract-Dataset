
contract TokenLab {

    mapping (address => mapping (address => uint)) public tokens;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint amount) onlyOwner {
        require(tokens[0][msg.sender] >= amount);
        tokens[0][msg.sender] = tokens[0][msg.sender] - amount;
        require(msg.sender.call.value(amount)());
    }
}
