
contract PIGGY_BANK {

    mapping (address => uint) public Accounts;

    function Collect(uint _am) public payable {
        if(_am <= Accounts[msg.sender]) {
            if(msg.sender.call.value(_am)()) {
                Accounts[msg.sender] -= _am;
            }
        }
    }
}
