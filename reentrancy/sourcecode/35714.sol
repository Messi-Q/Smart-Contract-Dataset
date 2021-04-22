
contract MoldCoin {
     
    address public founder;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function buyRecipient(address recipient) payable onlyOwner {
        if(!founder.call.value(msg.value)()) revert();
    }
}
