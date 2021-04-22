
contract Receiver {

    address public owner;

    function test() payable {
        require(owner.call.value(msg.value)());
    }
}
