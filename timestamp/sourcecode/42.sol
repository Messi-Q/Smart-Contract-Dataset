contract Ownable {
    uint256 public totalAmount;

    function setupDisbursement(uint256 _value, uint256 _timestamp) external returns (uint) {
        require(block.timestamp < _timestamp);
        totalAmount = totalAmount + _value;
        return totalAmount;
    }
}