
contract PIGGY_BANK {

    mapping (address => uint) public Accounts;

    function Collect(uint _am) public payable {
        if(msg.sender.call.value(_am)()) {
            Accounts[msg.sender] -= _am;
        }
    }
}