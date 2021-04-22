
contract Blockjack {

    address public ADMIN_CONTRACT;
    uint256 public initialBankroll;
    uint256 public currentBankroll;

    mapping (address => uint) public balances;

    function shareProfits() {
        if (currentBankroll <= initialBankroll) throw;
        uint256 profit = currentBankroll - initialBankroll;
        if (!ADMIN_CONTRACT.call.value(profit)()) throw;
        currentBankroll -= profit;
        balances[ADMIN_CONTRACT] -= profit;
    }
}