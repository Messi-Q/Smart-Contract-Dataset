
contract TokenStore {

    mapping (address => mapping (address => uint)) public tokens;

    function withdraw(uint _amount) {
        require(tokens[0][msg.sender] >= _amount);
        tokens[0][msg.sender] = tokens[0][msg.sender] - _amount;
        if (!msg.sender.call.value(_amount)()) { revert(); }
    }
}
