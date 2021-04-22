contract EcfToken{
    uint256 private lastUpdate;
    uint256 private totalSupply;

    function maintenance(uint256 amount) public {
        require(block.timestamp > (lastUpdate+2592000));
        require(amount <= (totalSupply/10));
        totalSupply += amount;
        return;
    }
}