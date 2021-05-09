contract Ownable {
    uint public totalAmount;

    function setupDisbursement(uint256 _value) external returns (uint) {
        totalAmount = totalAmount + _value;
        return totalAmount;
    }

    function deduction(uint256 _value){
        totalAmount = totalAmount - _value;
    }
}