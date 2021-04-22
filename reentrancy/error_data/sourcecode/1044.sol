
contract PoCGame {

    uint totalDonated = 0;
    mapping (address => uint) balances;
    address whale;

    function donateToWhale(uint256 amount) internal {
        whale.call.value(amount)();
        totalDonated += amount;
        balances[whale] -= amount;
    }
}
