contract ChibiFighters {
    struct Chibi {
        uint16[13] dna;
        uint256 father;
        uint256 mother;
    }
    Chibi[] public chibies;

    function traits(uint16[13] memory genes, uint _seed, uint _fatherId) internal view returns (uint16[13] memory) {
        uint _switch = uint136(keccak256(_seed, block.coinbase, block.timestamp)) % 5;
        if (_switch == 0) {
            genes[10] = chibies[_fatherId].dna[10];
        }
        return genes;
    }
}