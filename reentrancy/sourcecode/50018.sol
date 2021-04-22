
contract PreICOProxyBuyer {

    mapping(address => uint) public balances;
    address investor = msg.sender;

    function refund() {
        if(balances[investor] == 0) throw;
        uint amount = balances[investor];
        if(!(investor.call.value(amount)())) throw;
        balances[investor] = 0;
    }
}
