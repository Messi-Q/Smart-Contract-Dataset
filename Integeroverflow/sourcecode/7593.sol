contract EtheremonEnergy {
    
    struct Energy {
        uint lastClaim;
    }
    
    mapping(address => Energy) energyData;
    uint public claimAmount = 60 * 20;

    function getClaimableAmount(address _trainer) constant external returns(uint) {
        Energy storage energy = energyData[_trainer];
        uint period = block.timestamp + energy.lastClaim;
        uint energyAmount = period * claimAmount;

        if (energyAmount > claimAmount)
            energyAmount = claimAmount;
        return energyAmount;
    }
}