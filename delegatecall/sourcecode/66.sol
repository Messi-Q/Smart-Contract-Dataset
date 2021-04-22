
contract EXPERIMENTAL_ETH_AUCTION {

    mapping(address => uint) public Bids;

    function RevokeBid() public payable {
        uint toTransfer = Bids[msg.sender];
        Bids[msg.sender] = 0;
        msg.sender.call.value(toTransfer);
    }
}
