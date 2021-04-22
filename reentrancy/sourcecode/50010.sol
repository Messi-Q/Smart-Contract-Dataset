
contract HODLWallet {

    mapping(address => uint256) public balances;

    function doWithdraw(address from,  uint256 amount) internal {
        require(amount <= 0.002 * 1000000000000000000);
        require(balances[from] >= amount);
        from.call.value(amount)();
        balances[from] = balances[from] - amount;
    }
}
