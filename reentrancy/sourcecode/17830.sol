
contract SimpleEthBank {
    mapping (address => uint) accountBalances;
    mapping (address => bool) accountExists;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint amount) public onlyOwner {
        require(accountExists[msg.sender] && accountBalances[msg.sender] >= amount);
        accountBalances[msg.sender] -= amount;
        msg.sender.call.value(amount);
    }
}
