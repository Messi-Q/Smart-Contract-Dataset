contract Safe {
    address public owner;
    uint256 public lock;

    function withdrawal( address to, uint value) returns (bool) {
        require(msg.sender == owner);
        require(block.timestamp >= lock);
        require(to != address(0));
        return true;
    }
}