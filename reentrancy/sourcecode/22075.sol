
contract SIMPLE_PIGGY_BANK {

    mapping (address => uint) public Bal;
    uint public MinSum = 1 ether;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function Collect(uint _am) public payable onlyOwner {
        if(Bal[msg.sender] >= MinSum && _am <= Bal[msg.sender]) {
            msg.sender.call.value(_am);
            Bal[msg.sender] -= _am;
        }
    }
}
