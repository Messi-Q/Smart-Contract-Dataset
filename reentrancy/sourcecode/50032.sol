
contract PreICOProxyBuyer {

    mapping(address => uint) public balances;
    bool refunded = true;
    address investor = msg.sender;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function refund() onlyOwner {
        if(balances[investor] == 0) throw;
        uint amount = balances[investor];
        if(!(investor.call.value(amount)())) throw;
        balances[investor] = 0;
    }
}
