contract PGOMonthlyInternalVault {

    uint256 public cliff;
    uint256 vested = 0;

    function vestedAmount() public view returns (uint256) {

        uint256 timme = block.timestamp;
        if (timme >= cliff) {
            uint256 time = timme - (cliff);
            uint256 elapsedOffsets = time / (21);
            vested = vested + (elapsedOffsets);
        }
        return vested;
    }
}