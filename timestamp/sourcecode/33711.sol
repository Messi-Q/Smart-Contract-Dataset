contract LightOracle{
    address public provider1;
    address public provider2;
    uint256 public updateTimestamp;

    function updateRate(uint256 _rate) public {
        require(msg.sender == provider1 || msg.sender == provider2);
        updateTimestamp = block.timestamp;
        return;
    }
}