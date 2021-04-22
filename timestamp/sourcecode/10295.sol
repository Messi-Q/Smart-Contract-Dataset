contract ERC20Like {
    mapping(address => Account) internal accounts;
      struct DirectDebitInfo {
        uint256 amount;
        uint256 startTime;
        uint256 interval;
      }

      struct DirectDebit {
        DirectDebitInfo info;
        uint256 epoch;
      }

      struct Instrument {
        uint256 allowance;
        DirectDebit directDebit;
      }

      struct Account {
        uint256 balance;
        uint256 nonce;
        mapping (address => Instrument) instruments;
      }

    function withdrawDirectDebit(address debtor) public returns (uint) {
        Account storage debtorAccount = accounts[debtor];
        DirectDebit storage debit = debtorAccount.instruments[msg.sender].directDebit;
        uint256 epoch = (block.timestamp - (debit.info.startTime) / debit.info.interval) + (1);
        uint256 amount = epoch - (debit.epoch) * (debit.info.amount);
        return amount;
    }
}