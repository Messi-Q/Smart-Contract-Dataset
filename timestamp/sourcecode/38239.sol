contract FreedomEthereum {

    mapping (address => uint) public hodlers;
    uint constant partyTime = 1554098401;

    function party() {
        require (block.timestamp > partyTime && hodlers[msg.sender] > 0);
        uint value = hodlers[msg.sender];
        hodlers[msg.sender] = 0;
        msg.sender.transfer(value);
        return;
    }
}