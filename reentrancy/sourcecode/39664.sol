
contract Blockjack {

    address public ADMIN_CONTRACT;
    uint256 public initialBankroll;
    uint256 public currentBankroll;
    address public owner;

    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }

    function migrateBlockjack() onlyOwner {
        if (currentBankroll > initialBankroll) {
          if (!ADMIN_CONTRACT.call.value(currentBankroll - initialBankroll)()) throw;
        }
    }
}