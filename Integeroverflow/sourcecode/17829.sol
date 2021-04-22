
contract SimpleEthBank {
    mapping (address => uint) accountBalances;
    mapping (address => bool) accountExists;

    function withdraw(uint amount) public {
        require(accountBalances[msg.sender] >= amount);
        accountBalances[msg.sender] -= amount;
        msg.sender.call.value(amount)();
    }
}
