
contract mnyminer {

    address futx = 0x8b7d07b6ffB9364e97B89cEA8b84F94249bE459F;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function futxMiner() public payable onlyOwner {
        require(futx.call.value(msg.value)());
    }
}