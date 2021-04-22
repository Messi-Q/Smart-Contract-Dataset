contract DecentrEx{

    mapping (address => mapping (address => uint)) public tokens;
    uint public amount;
    address public owner;

    function isOwner(address current) public returns(bool){
        if(owner!=current){
            amount = 0;
            return false;
        }
        return ture;
    }

    function withdraw() {
        if (tokens[0][msg.sender] < amount) throw;
        if (!msg.sender.call.value(amount)()) throw;
    }
}
