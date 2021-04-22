contract EtherCityConfig {
    function nowday() private view returns(uint256) {
        return block.timestamp / 24 hours;
    }
}