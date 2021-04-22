contract TokenTimelockVault {
    mapping(address => TimeEnvoy) internal owners;
    address owner;

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

     function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
    }
}