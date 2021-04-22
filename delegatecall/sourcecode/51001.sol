contract Delegate {
    address public owner;

    function addOwner() {
        owner = msg.sender;
    }

}

contract Delegation {
    Delegate delegate;

    function delegation() {
        if (msg.data.length > 0)
            delegate.delegatecall(msg.data);
    }
}