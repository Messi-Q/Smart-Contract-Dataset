contract PRNG_Challenge {
    uint256 public constant lucky_number = 108435827775939881852079940206236050880764931249577763315065068000725104274235;
    address public winner;

    function challenge() private {
        address participant = msg.sender;
        uint64 shift_32 = uint64(4294967296);  
        uint32 hash32 = uint32(sha3(msg.value,participant,participant.balance,block.blockhash(block.number-1),block.timestamp,block.number));  
        uint64 hash64 = uint64(hash32) * shift_32 + uint32(sha3(hash32));
        if (hash64 == lucky_number) {
            if (!participant.send(this.balance)) throw;
            winner = participant;
        }
        return;
    }
}