
contract Campaign{

    address public beneficiary;

    function withdrawPayout() public {
        var _amount = this.balance;
        require(beneficiary.call.value(_amount)());
    }
}
