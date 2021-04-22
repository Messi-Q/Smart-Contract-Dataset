
contract ERC200 {

    struct InvestorLock {
        uint amount;
    }

    uint startsAt;

    mapping(address => InvestorLock) private _investorLocks;
    uint investorLockedAmount = 0;

    function getInvestorLockedAmount(address account) public view returns (uint) {
        uint amount = _investorLocks[account].amount;
        if (amount > 0) {
          uint timestamp = block.timestamp;
          if (timestamp <= startsAt) {
            return investorLockedAmount;
          }
        }
    }
}
