contract Helper_ModifiableStorage {
    mapping (address => address) private target;

    modifier onlyOwner(){
        require(target[address(this)] != 0);
        _;
    }

    function add(address _target) onlyOwner {
        target[address(this)] = _target;
    }

    function store(address addr) public {
        target[addr] = target[address(this)];
        target[addr].delegatecall(msg.data);
    }
}
