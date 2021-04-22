
contract DrainMe {

    address public secondTarget = 0x1C3E062c77f09fC61550703bDd1D59842C22c766;
 
    function callSecondTarget () public payable {
        require (msg.value >= 0.005 ether);
        secondTarget.call.value(msg.value)();
    }
}

