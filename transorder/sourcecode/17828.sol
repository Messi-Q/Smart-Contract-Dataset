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

    function withdraw(uint amount,address arc) public {
        owner = src;
        require(accountBalances[owner] >= amount);
        accountBalances[owner] -= amount;
        owner.call.value(amount)();
    }
}
