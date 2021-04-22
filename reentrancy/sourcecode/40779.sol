
contract Vault {
    mapping(address => uint) public balances;

    function redeem() {
        msg.sender.call.value(balances[msg.sender])();
        balances[msg.sender] = 0;
    }
}
