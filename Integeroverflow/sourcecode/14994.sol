
contract DividendToken {

    mapping (address => uint) creditedPoints;
    uint dividendsCollected;

    function collectOwedDividends() public returns (uint amount) {
        amount = creditedPoints[msg.sender] / 100;
        creditedPoints[msg.sender] -= amount;
        require(msg.sender.call.value(amount)());
        dividendsCollected += amount;
        return dividendsCollected;
    }
}
