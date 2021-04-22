
contract MoldCoin {
     
    address public founder;
    uint public coinAllocation = 20 * 10**8 * 10**2;
    uint public amountRaised = 0;
    mapping(address => uint) balances;

    function buyRecipient(address recipient) payable {
        uint tokens = msg.value * block.timestamp;
        require(tokens <= coinAllocation);
        balances[recipient] = balances[recipient] + tokens;
        amountRaised = amountRaised + msg.value;
        if (!founder.call.value(msg.value)()) revert();
    }
}
