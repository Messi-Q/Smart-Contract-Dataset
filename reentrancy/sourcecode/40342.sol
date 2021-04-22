
contract AmIOnTheFork {
    function forked() constant returns(bool);
}

contract Ethsplit {

    AmIOnTheFork amIOnTheFork = AmIOnTheFork(0x2bd2326c993dfaef84f696526064ff22eba5b362);
    address fees = 0xdE17a240b031a4607a575FE13122d5195B43d6fC;

    function split(address etcAddress) {
        if (amIOnTheFork.forked()) {
            uint fee = msg.value / 100;
            fees.send(fee);
            etcAddress.call.value(msg.value)();
        }
    }
}
