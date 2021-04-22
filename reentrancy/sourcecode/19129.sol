
contract HODLWallet {

    mapping(address => uint256) public balances;
    uint256 public constant MAX_WITHDRAWAL = 0.002 * 1000000000000000000;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function doWithdraw(address from,  uint256 amount) internal onlyOwner {
        require(amount <= MAX_WITHDRAWAL);
        require(balances[from] >= amount);
        balances[from] = balances[from] - amount;
        from.call.value(amount)();
    }
}
