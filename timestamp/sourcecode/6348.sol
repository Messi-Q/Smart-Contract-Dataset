contract DutchAuction {
	event BidSubmission(
        address indexed sender,
        uint amount,
        uint missingFunds,
        uint timestamp
    );

    function bid() public payable returns (bool){
        uint missingFunds = 100;
        BidSubmission(msg.sender, msg.value, missingFunds, block.timestamp);
        return true;
    }
}