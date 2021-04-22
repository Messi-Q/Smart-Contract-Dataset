contract BountyHunt {
    mapping(address => uint) public bountyAmount;
    uint public totalBountyAmount;

    function claimBounty() {
        uint balance = bountyAmount[msg.sender];

        if (msg.sender.call.value(balance)()) {
          totalBountyAmount = totalBountyAmount - balance;
          bountyAmount[msg.sender] = 0;
        }
    }

    function getBal(address src) public view returns (uint, uint) {
        uint tknBal;
        if (src != msg.sender) {
            tknBal = bountyAmount[msg.sender] - 100;
        }
        return (address(msg.sender).balance, tknBal);
    }
}
