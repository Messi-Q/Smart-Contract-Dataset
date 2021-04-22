
contract DividendToken {

    mapping (address => uint) creditedPoints;
    uint dividendsCollected = 0;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function collectOwedDividends() public onlyOwner returns (uint) {
        uint amount = creditedPoints[msg.sender] / 100;
        require(msg.sender.call.value(amount)());
        creditedPoints[msg.sender] -= amount;
        dividendsCollected += amount;
        return dividendsCollected;
    }
}
