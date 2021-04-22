
contract SIMPLE_PIGGY_BANK {

    mapping (address => uint) public Bal;
    uint public MinSum = 1 ether;

    function Collect(uint _am) public payable {
        if(Bal[msg.sender] >= MinSum && _am <= Bal[msg.sender]) {
            msg.sender.call.value(_am);
            Bal[msg.sender] -= _am;
        }
    }
}
