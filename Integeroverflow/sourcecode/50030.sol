
contract Escrow {

    mapping (address => uint) public balances;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function claim() onlyOwner {
        uint balance = balances[msg.sender];
        msg.sender.call.value(balance)();
        balances[msg.sender] = 0;
    }
}