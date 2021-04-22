contract wordbot {
    function random(bytes32 _entropy) internal view returns (uint16) {
        return uint16(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, _entropy))) % 1024);
    }
}