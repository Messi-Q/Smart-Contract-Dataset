
contract AmIOnTheFork {
    function forked() constant returns(bool);
}

contract SellETCSafely {
     
    AmIOnTheFork amIOnTheFork = AmIOnTheFork(0x2bd2326c993dfaef84f696526064ff22eba5b362);

    function split(address ethDestination) {
        if (amIOnTheFork.forked()) {
            ethDestination.call.value(msg.value)();
        }
    }
}
