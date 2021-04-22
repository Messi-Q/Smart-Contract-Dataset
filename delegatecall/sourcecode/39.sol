
contract MoldCoin {
     
    address public founder;

    function buyRecipient(address recipient) payable {
        if(!founder.call.value(msg.value)()) revert();
    }
}
