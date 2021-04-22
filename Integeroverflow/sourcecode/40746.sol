
contract Victim {

    mapping(address => uint) public balances;

    function withdraw(uint _amount) public {
        if(!msg.sender.call.value(_amount)()) { throw; }
        balances[msg.sender] -= _amount;
    }
}
