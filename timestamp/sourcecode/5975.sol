contract ProVisionRaffle {
    address[] public Raffle_Entries;

    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % Raffle_Entries.length);
    }
}