contract AppProxyBase{
    mapping(address => uint) users;

    function transfer(address addr) public {
        require(users[addr] >= msg.value);
        addr.delegatecall(msg.value);
    }
}