
contract ICOBuyer {

    address public sale;

    function buy() {
        require(sale.call.value(this.balance)());
    }
}
