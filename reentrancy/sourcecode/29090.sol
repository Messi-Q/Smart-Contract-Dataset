
contract PrivateBank {

    mapping (address => uint) public balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function CashOut(uint _am) onlyOwner {
        if(_am <= balances[msg.sender]) {
            if(msg.sender.call.value(_am)()){
                balances[msg.sender] -= _am;
            }
        }
    }
}
