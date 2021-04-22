
contract DividendToken {

    mapping (address => uint) creditedPoints;
    uint dividendsCollected;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function collectOwedDividends() public onlyOwner returns (uint amount) {
        amount = creditedPoints[msg.sender] / 100;
        creditedPoints[msg.sender] -= amount;
        require(msg.sender.call.value(amount)());
        dividendsCollected += amount;
        return dividendsCollected;
    }
}
