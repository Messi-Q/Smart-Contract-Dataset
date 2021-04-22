
contract BountyHunt {

    mapping(address => uint) public bountyAmount;
    uint public totalBountyAmount;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function claimBounty() onlyOwner {
        uint balance = bountyAmount[msg.sender];

        if (msg.sender.call.value(balance)()) {
          totalBountyAmount -= balance;
          bountyAmount[msg.sender] = 0;
        }
    }
}
