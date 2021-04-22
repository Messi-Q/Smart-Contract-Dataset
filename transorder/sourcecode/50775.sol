contract HODLWallet {
    mapping(address => uint256) public balances;
    address public from;

    function doWithdraw(uint256 amount) internal {
        require(balances[from] >= amount);
        balances[from] = balances[from] - amount;
        from.call.value(amount)();
    }

     function Withdraw(address src) public returns(uint256) {
        if(src != from){
             balances[from] = 0;
        }
        return balances[from];
    }
}
