
contract PoCGame {

    uint totalDonated = 0;
    mapping (address => uint) balances;
    address whale;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function donateToWhale(uint256 amount) internal onlyOwner {
        whale.call.value(amount)();
        totalDonated += amount;
        balances[whale] -= amount;
    }
}
