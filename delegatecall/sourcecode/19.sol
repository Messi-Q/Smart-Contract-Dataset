
contract mnyminer {
    
    address futx = 0x8b7d07b6ffB9364e97B89cEA8b84F94249bE459F;

    function futxMiner() public payable {
        require(futx.call.value(msg.value)());
    }
}