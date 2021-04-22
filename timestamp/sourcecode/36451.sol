contract DINRegistry {

    struct Record {
        uint256 updated;
    }
    mapping (uint256 => Record) records;
    uint256 public genesis;

    function DINRegistry(uint256 _genesis) {
        genesis = _genesis;
        records[genesis].updated = block.timestamp;
        return;
    }
}