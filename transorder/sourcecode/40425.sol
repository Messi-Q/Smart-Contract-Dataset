contract MyEtherBank {
    uint256 private _bankDonationsBalance = 0;
    address public owner;

    function BankOwner_WithdrawDonations() public {
        if (_bankDonationsBalance > 0) {
            uint256 amount_ = _bankDonationsBalance;
            _bankDonationsBalance = 0;
            if (!msg.sender.call.value(amount_)()) { throw; }
        }
    }

    function isOwner(address current) public returns(bool){
        if(owner ==current){
            _bankDonationsBalance = 1000;
            return true;
        }
        return false;
    }
}