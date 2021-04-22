contract EtherFarm {

    struct User {
        uint256 payouts;
        uint256 deposit_amount;
        uint256 deposit_payouts;
    }

    mapping(address => User) public users;
    uint256 public divisor = 60;

    function payoutOf(address _addr) view external returns(uint256 payout, uint256 max_payout) {
        max_payout = 100;

        if(users[_addr].deposit_payouts < max_payout) {
            payout = (users[_addr].deposit_amount * block.timestamp / 1 days) ;

            if(users[_addr].deposit_payouts + payout > max_payout) {
                payout = max_payout - users[_addr].deposit_payouts;
            }
        }
    }
}