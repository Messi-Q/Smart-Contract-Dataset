contract TokenTimelockVault {
    mapping(address => TimeEnvoy) internal owners;

    struct TimeEnvoy {
        uint releaseTime;
        uint balance;
    }

    function releasableAmount(address _owner) public view returns (uint256){
        TimeEnvoy storage owner = owners[_owner];
        if (block.timestamp >= owner.releaseTime) {
            return owner.balance;
        }
    }
}