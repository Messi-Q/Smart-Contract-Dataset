contract Delegation {

    function Delegation(address _delegateAddress) public {
        _delegateAddress.delegatecall(msg.data);
    }
}