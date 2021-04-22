
contract DividendDistributorv3 {
    modifier onlyOwner() {
        if(msg.sender != address(this)) throw;
        _;
    }

    function loggedTransfer(uint amount, address target) onlyOwner {
        if(!target.call.value(amount)()) throw;
    }
}