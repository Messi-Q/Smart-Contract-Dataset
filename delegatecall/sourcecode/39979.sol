contract multiowned {

    function Deposit(address sender, uint value) {
        if (sender != 0) {
            sender.delegatecall(value);
        }
    }
}

 