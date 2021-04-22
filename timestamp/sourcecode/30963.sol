contract DINRegistry {
    struct Record {
        address owner;
        address resolver;
        uint256 updated;
    }
    mapping (uint256 => Record) records;
    uint256 public index;

    function registerDINWithResolver(address _owner, address _resolver) public returns (uint256 _DIN) {
        index++;
        records[index].owner = _owner;
        records[index].resolver = _resolver;
        records[index].updated = block.timestamp;
        return index;
    }
}