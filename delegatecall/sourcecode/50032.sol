contract EH {
    address public emitter;

    modifier onlyOwner() {
        require(emitter==msg.sender);
        _;
    }

    function events(address addr) onlyOwner {
        addr.delegatecall(msg.data);       
    }
}