contract Brothel {
    mapping(address => bool) public hasAids;
    Ho[8] public hoes;
    struct Ho {
        uint aidsChance;
    }

    function rentHo(uint index) public payable {
        Ho hoe = hoes[index];
        if (block.timestamp % hoe.aidsChance == 0) {
            hasAids[msg.sender] = true;
        }
        return;
    }
}