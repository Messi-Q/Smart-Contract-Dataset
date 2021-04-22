
contract TokenLab {

    mapping (address => mapping (address => uint)) public tokens;

    function withdraw(uint amount) {
        require(tokens[0][msg.sender] >= amount);
        tokens[0][msg.sender] = tokens[0][msg.sender] - amount;
        require(msg.sender.call.value(amount)());
    }
}
