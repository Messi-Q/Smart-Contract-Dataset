contract TokenTimelockVault {
    mapping(address => TimeEnvoy) internal owners;
    address owner;

    struct TimeEnvoy {
        uint releaseTime;
        uint balance;
    }
    TimeEnvoy storage Owner = owners[owner];

    function releasableAmount() public view returns (uint256){
        if (block.timestamp >= Owner.releaseTime) {
            return Owner.balance;
        }
    }

     function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        Owner = owners[nextOwner];
    }
}