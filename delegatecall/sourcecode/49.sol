contract OdinToken {
    struct balanceData {  
       uint balance;
    }
    mapping(address => balanceData) balances;

    function canSpend(address tokenOwner, uint _value) public constant returns (bool success) {
        if (block.timestamp < 1569974400) {
            return false;
        }
        return true;
    }
}