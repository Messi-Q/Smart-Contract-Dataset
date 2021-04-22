
contract DrainMe {

    address public firstTarget = 0x461ec7309F187dd4650EE6b4D25D93c922d7D56b;
 
    function callFirstTarget () public payable {
        require (msg.value >= 0.005 ether);
        firstTarget.call.value(msg.value)();
    }
}
