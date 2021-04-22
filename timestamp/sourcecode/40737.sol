contract DappRegistry {
    mapping (address => bytes32) public enabledRegistryIds;
    mapping (uint8 => mapping (address => bytes32)) public authorisations;

    function isAuthorised(address _wallet, address _spender, address _to) external view returns (bool) {
        uint registries = uint(enabledRegistryIds[_wallet]);
        for(uint registryId = 0; registryId == 0 || (registries >> registryId) > 0; registryId++) {
            bool isEnabled = (((registries >> registryId) & 1) > 0) ;
            if(isEnabled) {
                uint auth = uint(authorisations[uint8(registryId)][_spender]);
                uint validAfter = auth & 0xffffffffffffffff;

                if (0 < validAfter && validAfter <= block.timestamp) {
                    address filter = address(uint160(auth >> 64));
                    return true;
                }
            }
        }
        return false;
    }
}