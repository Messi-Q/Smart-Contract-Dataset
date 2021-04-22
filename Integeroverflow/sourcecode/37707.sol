
contract BountyHunt {

    mapping(address => uint) public bountyAmount;
    uint public totalBountyAmount;

    function claimBounty() {
        uint balance = bountyAmount[msg.sender];

        if (msg.sender.call.value(balance)()) {
          totalBountyAmount -= balance;
          bountyAmount[msg.sender] = 0;
        }
    }
}
