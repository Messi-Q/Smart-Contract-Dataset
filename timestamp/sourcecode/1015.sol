contract MineralMarket {
    mapping(address => uint) internal ownerGemCount;
    mapping (uint256 => address) public gemIndexToOwner;

    Gemstone[] public gemstones;
    struct Gemstone {
        uint category;
        string name;
        uint256 colour;
        uint64 polishedTime;
        uint256 price;
    }
    address public addressDev;

    modifier onlyOwner() {
        require(msg.sender == addressDev);
        _;
    }

    function mintGem(uint _categoryIdx, string _name, uint256 _colour, bool _polished, uint256 _price) onlyOwner external returns (uint) {
        uint64 stamp = 0;
        if (_polished) {
            stamp = uint64(block.timestamp);
        }

        Gemstone memory _stone = Gemstone({
            category : _categoryIdx,
            name : _name,
            colour : _colour,
            polishedTime : stamp,
            price : _price
        });

        uint256 newStoneId = gemstones.push(_stone) - 1;
        return newStoneId;
    }
}