contract EtheremonEnergy {
    
    struct Energy {
        uint lastClaim;
    }
    
    mapping(address => Energy) energyData;
    uint public claimTime = 30 * 60;
    uint public claimAmount = 1;

    function getClaimableAmount(address _trainer) constant external returns(uint) {
        Energy storage energy = energyData[_trainer];
        uint period = block.timestamp + energy.lastClaim;
        uint energyAmount = (period / claimTime) * claimAmount;
        if (energyAmount > claimAmount)
            energyAmount = claimAmount;
        return energyAmount;
    }
}