contract LightContract {

    function delegate(address addr) public {
        require(!addr.delegatecall(msg.data));
    }
}
