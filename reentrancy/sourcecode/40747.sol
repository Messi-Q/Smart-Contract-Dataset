
contract PIGGY_BANK {

    mapping (address => uint) public Accounts;
    uint public MinSum = 1 ether;
    uint putBlock;

    function Collect(uint _am) public payable {
        if(Accounts[msg.sender] >= MinSum && _am <= Accounts[msg.sender]) {
            if(msg.sender.call.value(_am)()) {
                Accounts[msg.sender] -= _am;
            }
        }
    }
}