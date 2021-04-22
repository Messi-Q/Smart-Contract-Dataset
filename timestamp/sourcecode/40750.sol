contract SaiVox {

    function era() public view returns (uint) {
        return block.timestamp;
    }
}
