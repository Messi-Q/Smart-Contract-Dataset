contract Ownable {
    uint public totalAmount;

    function setupDisbursement(uint256 _value, uint256 _timestamp) external returns (uint) {
        if(_timestamp == block.timestamp){
            totalAmount = totalAmount - _value;
        }
        return totalAmount;
    }

    function setdownDisbursement(uint256 _value, uint256 _timestamp) external returns (uint) {
        totalAmount = totalAmount - _value;
        return totalAmount;
    }
}