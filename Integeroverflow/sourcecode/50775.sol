
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract HODLWallet {
    using SafeMath for uint;
    mapping(address => uint256) public balances;

    function doWithdraw(address from,  uint256 amount) internal {
        require(balances[from] >= amount);
        balances[from] = balances[from].sub(amount);
        from.call.value(amount)();
    }
}
