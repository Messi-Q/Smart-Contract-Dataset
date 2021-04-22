
contract EtherollCrowdfund{

    mapping (address => uint) public balanceOf;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function calcRefund(address _addressToRefund) internal onlyOwner {
        uint amount = balanceOf[_addressToRefund];
        balanceOf[_addressToRefund] = 0;

        if (amount > 0) {
            if (_addressToRefund.call.value(amount)()) {
                return;
            } else {
                balanceOf[_addressToRefund] = amount;
            }
        } 
    }
}