
contract SimpleEthBank {

    mapping (address => uint) accountBalances;

    function withdraw(uint amount) public {
        accountBalances[msg.sender] -= amount;
        msg.sender.call.value(amount);
    }
}
