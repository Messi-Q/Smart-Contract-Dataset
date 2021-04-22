
contract SimpleEthBank {

    mapping (address => uint) accountBalances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint amount) public onlyOwner {
        require(accountBalances[msg.sender] >= amount);
        accountBalances[msg.sender] -= amount;
        msg.sender.call.value(amount);
    }
}
