contract Ownable {
    uint public totalAmount;

    function setupDisbursement(uint256 _value, uint256 _timestamp) external returns (uint) {
        totalAmount = totalAmount + _value;
        return totalAmount;
    }
}