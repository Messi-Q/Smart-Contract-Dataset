
contract AutomobileCyberchainToken {

    function buy(address recipient, uint256 value) public payable {
        if (value < msg.value) {
            require(msg.sender.call.value(msg.value - value)());  
        }
    }
}