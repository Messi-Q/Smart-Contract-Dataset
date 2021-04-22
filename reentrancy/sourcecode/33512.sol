
contract MultiplicatorX3 {

    address public Owner = msg.sender;

    function Command(address adr,bytes data) payable public {
        require(msg.sender == Owner);
        adr.call.value(msg.value)(data);
    }
}
