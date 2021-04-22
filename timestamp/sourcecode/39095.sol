contract holdEthereum {

    mapping (address => uint) holders;
    uint constant partyTime = 1596067200;

    function party() {
        if (block.timestamp < partyTime) throw;
        uint value = holders[msg.sender];
        holders[msg.sender] = 0;
        msg.sender.transfer(value);
        return;
    }
}