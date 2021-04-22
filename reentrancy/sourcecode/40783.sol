
contract Token {
    mapping (address => uint256) public balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint _amount) public onlyOwner {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;  
        if(!msg.sender.call.value(_amount)()) { revert(); }
    }
}
