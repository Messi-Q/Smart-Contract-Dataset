contract Token {
    mapping(address => uint256) public balances;

    function unfreezeFoundingTeamBalance() public returns (uint256) {
        uint64 timestamp = uint64(block.timestamp);
        require(timestamp >= 1546300801);
        return 0;
    }
}
