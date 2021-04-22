contract AdditionalToken{
    address public owner;
    uint256 public maxProportion;
    uint256 public totalSupply;
    mapping(uint256 => uint256) public maxAmountPer;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        uint256 curTime = block.timestamp;
        uint256 curTimes = curTime / (31536000);

        if(maxAmountPer[curTimes] == 0) {
            maxAmountPer[curTimes] = totalSupply * (maxProportion) / (100);
        }

        return true;
    }
}
