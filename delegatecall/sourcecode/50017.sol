contract ProtocolSettings {
    address public owner;

    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

    function setSupportedTokens(address addr, bool withApprovals) external onlyOwner {
        if (withApprovals) {
            bytes memory data = abi.encodeWithSelector(0x4a99e3a1, addr);
            addr.delegatecall(data);
        }
    }
}
