
contract HODLWallet {

    mapping(address => uint256) public balances;
    uint256 public constant MAX_WITHDRAWAL = 0.002 * 1000000000000000000;

    function doWithdraw(address from,  uint256 amount) internal {
        require(amount <= MAX_WITHDRAWAL);
        require(balances[from] >= amount);
        balances[from] = balances[from] - amount;
        from.call.value(amount)();
    }
}
