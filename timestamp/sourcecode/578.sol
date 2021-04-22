contract ERC20Like {
    mapping(address => Account) internal accounts;

    struct DirectDebitInfo {
        uint256 startTime;
    }
    struct DirectDebit {
        DirectDebitInfo info;
        uint256 epoch;
    }
    struct Instrument {
        DirectDebit directDebit;
    }
    struct Account {
        mapping (address => Instrument) instruments;
    }

    function withdrawDirectDebit(address debtor) public returns (bool) {
        Account storage debtorAccount = accounts[debtor];
        DirectDebit storage debit = debtorAccount.instruments[msg.sender].directDebit;
        uint256 epoch = (block.timestamp - debit.info.startTime) + 1;
        uint256 amount = epoch - (debit.epoch);
        require(amount > 0);
        return true;
    }
}