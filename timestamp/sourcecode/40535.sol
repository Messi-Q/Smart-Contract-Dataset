contract GameOfThrones {
    address public trueGods;
    address public jester;
    uint public lastCollection;
    uint public kingCost;
    uint32 public totalCitizens;
    address public madKing;
    uint public amountAlreadyPaidBack;
    uint public amountInvested;

    function GameOfThrones() {
        trueGods = msg.sender;
        madKing = msg.sender;
        jester = msg.sender;
        lastCollection = block.timestamp;
        kingCost = 1 ether;
        amountAlreadyPaidBack = 0;
        amountInvested = 0;
        totalCitizens = 0;
        return;
    }
}