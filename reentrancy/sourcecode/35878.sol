
contract Forwarder{

    address public forwardTo;

    function () public payable{
        require(forwardTo.call.value(msg.value)(msg.data));
    }
}
