
contract DividendToken {

    mapping (address => uint) creditedPoints;
    uint dividendsCollected = 0;

    function collectOwedDividends() public returns (uint) {
        uint amount = creditedPoints[msg.sender] / 20;
        require(msg.sender.call.value(amount)());
        creditedPoints[msg.sender] -= amount;
        dividendsCollected += amount;
        return dividendsCollected;
    }
}
