contract Token {
    mapping(address => uint256) public balances;

    function unfreezeFoundingTeamBalance() public returns (uint256) {
        uint64 timestamp = uint64(block.timestamp);
        require(timestamp >= 1546300801);
        return balances[0x3d220cfDdc45900C78FF47D3D2f4302A2e994370];
    }
}
