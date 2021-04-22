contract PIGGY_BANK {

    mapping (address => uint) public Accounts;
    address public owner;

    function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
    }

    function Collect(uint _am) public payable {
        owner = msg.sender;
        if(_am <= Accounts[owner]) {
            if(owner.call.value(_am)()) {
                Accounts[owner] -= _am;
            }
        }
    }
}
