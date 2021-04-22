
contract Bank{

    mapping (address => uint256) public balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw() onlyOwner {
        require(msg.sender.call.value(balances[msg.sender])());
        balances[msg.sender]=0;
    }
}
