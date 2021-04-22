contract Directory {
    struct Entry {
        string name;
        string company;
        string description;
        string category;
        address ethAddress;
        uint256 timestamp;
        bool deprecated;
    }

    mapping(address => Entry) public directory;
    Entry[] public entries;

    function addEntry(string name, string company, string description, string category, address ethAddress) public returns (bool) {
        var entry = Entry(name, company, description, category, ethAddress, block.timestamp, false);
        directory[ethAddress] = entry;
        entries.push(entry);
        return true;
    }
}