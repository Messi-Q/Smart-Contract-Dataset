
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract EtheremonEnergy {
    using SafeMath for uint;

    struct Energy {
        uint lastClaim;
    }
    
    mapping(address => Energy) energyData;
    uint public claimAmount = 1;

    function getClaimableAmount(address _trainer) constant external returns(uint) {
        Energy storage energy = energyData[_trainer];
        uint period = block.timestamp.add(energy.lastClaim);
        uint energyAmount = period.mul(claimAmount);
        if (energyAmount > claimAmount)
            energyAmount = claimAmount;
        return energyAmount;
    }
}