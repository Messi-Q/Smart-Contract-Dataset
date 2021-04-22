contract MMaker {
    mapping (uint8 => address) players;
    uint8 number;

    function randomtest() internal returns(uint8){
        uint8 inter = uint8(uint256(keccak256(block.timestamp)) % number);
        return uint8(uint256(keccak256(players[inter])) % number);
    }
}