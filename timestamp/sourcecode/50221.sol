
contract KingOfTheHill {
    uint public withdrawDelay;

    function takeAll() public {
        require(block.timestamp >= withdrawDelay);
        msg.sender.transfer(this.balance);
    }
}