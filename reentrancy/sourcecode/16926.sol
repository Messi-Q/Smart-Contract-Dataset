
contract PoormansHoneyPot {

    mapping (address => uint) public balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw() public onlyOwner {
        assert(msg.sender.call.value(balances[msg.sender])()) ;
        balances[msg.sender] = 0;
    }
}