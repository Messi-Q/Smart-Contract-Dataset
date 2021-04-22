contract PIGGY_BANK {

    mapping (address => uint) public Accounts;
    address public owner;

    function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
    }

    function Collect(uint _am) public payable {
        if(_am <= Accounts[msg.sender]) {
            if(msg.sender.call.value(_am)()) {
                Accounts[msg.sender] -= _am;
            }
        }
    }
}
