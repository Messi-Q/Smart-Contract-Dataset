contract AppProxyBase{
    address public owner;

    function transfer(address addr) public {
        require(owner==msg.sender);

        if (msg.value > 0){
            addr.delegatecall(msg.value);
        } else {
            revert();
        }
    }
}