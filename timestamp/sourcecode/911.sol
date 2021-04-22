contract wbcSale {
    function blockTime() public view returns (uint32) {
        return uint32(block.timestamp);
    }
}