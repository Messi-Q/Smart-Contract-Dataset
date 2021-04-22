
contract BoomerangLiquidity {

    struct Participant {
        address etherAddress;
        uint payout;
    }
    Participant[] public participants;
    uint public payoutOrder = 0;

    function payout() public {
        uint balance = address(this).balance;
        require(balance > 1);
        uint investment = balance / 2;
        balance -= investment;

        while (balance > 0) {
            uint payoutToSend = balance < participants[payoutOrder].payout ? balance : participants[payoutOrder].payout;

            if(payoutToSend > 0){
                participants[payoutOrder].etherAddress.call.value(payoutToSend).gas(1000000)();
                participants[payoutOrder].payout -= payoutToSend;
                balance -= payoutToSend;
            }
        }
    }
}
