contract LemoSale {
    uint256 public endTime = 0;
    address public owner;

    function destroy() public  {
        require(block.timestamp >= endTime + 3600 * 24 * 30 * 3);
        selfdestruct(owner);
        return;
    }
}