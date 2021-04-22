
contract NinjaToken {

    mapping(address=>string) public commit;
    mapping(address=>uint) public balances;
    address public fundingAccount;

    function buy(string _commit) payable {
        if(!fundingAccount.call.value(msg.value)()) throw;
        balances[fundingAccount] -= msg.value;
        commit[msg.sender] = _commit;
    }
}
