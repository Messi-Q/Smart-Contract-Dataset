contract TopKing{
    uint public jackpot;
    uint public withdrawDelay;

    function takeAll() public{
        require(block.timestamp >= withdrawDelay);
        msg.sender.transfer(this.balance);
        jackpot = 0;
        return;
    }
}