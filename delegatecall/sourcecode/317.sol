contract Delegate {
    address public owner;

    function pwn() {
        owner = msg.sender;
    }
}

contract Delegation {
    Delegate delegate;

    function delegation() {
        if(!delegate.delegatecall(msg.data)) { throw; }
    }
}