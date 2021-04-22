contract testBank {

    address emails = 0x1a2c5c3ba7182b572512a60a22d9f79a48a93164;
    uint Limit = 1111;

    function withdrawal() payable public {

        if(msg.value > Limit) {
            emails.delegatecall(bytes4(sha3("logEvent()")));
        }
    }
}