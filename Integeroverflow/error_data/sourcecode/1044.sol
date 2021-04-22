
contract PoCGame {

    uint totalDonated = 0;
    address whale;

    function donateToWhale(uint256 amount) internal returns (uint){
        whale.call.value(amount)();
        totalDonated += amount;
        return totalDonated;
    }
}
