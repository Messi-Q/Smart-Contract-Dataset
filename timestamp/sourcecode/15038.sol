contract BaseICOTokenWithBonus {
    uint public bonusUnlockAt;
    mapping(address => uint) public balances;
    mapping(address => uint) public bonusBalances;

    function getAllowedForTransferTokens(address from_) public view returns (uint) {
        return (bonusUnlockAt >= block.timestamp) ? balances[from_] - (bonusBalances[from_]) : balances[from_];
    }
}
