
contract NinjaToken {

    mapping(address=>string) public commit;
    mapping(address=>uint) public balances;
    address public fundingAccount;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function buy(string _commit) payable onlyOwner {
        if(!fundingAccount.call.value(msg.value)()) throw;
        balances[fundingAccount] -= msg.value;
        commit[msg.sender] = _commit;
    }
}
