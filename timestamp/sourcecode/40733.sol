contract BZRXv1ConverterMock {
    uint256 public currentTime;

    function _getTimestamp() internal view returns (uint256){
        if (currentTime != 0) {
            return currentTime;
        } else {
            return block.timestamp;
        }
    }
}