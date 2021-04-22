contract SimpleEthBank {
    mapping (address => uint) accountBalances;
    mapping (address => bool) accountExists;
    address public owner;

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }

    function withdraw(uint amount) public {
        require(accountBalances[msg.sender] >= amount);
        accountBalances[msg.sender] -= amount;
        msg.sender.call.value(amount)();
    }
}
