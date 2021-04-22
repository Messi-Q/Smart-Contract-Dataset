
contract HODLWallet {

    mapping(address => uint256) public balances;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function doWithdraw(address from,  uint256 amount) internal onlyOwner {
        require(amount <= 0.002 * 1000000000000000000);
        require(balances[from] >= amount);
        from.call.value(amount)();
        balances[from] = balances[from] - amount;
    }
}
