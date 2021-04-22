contract IMigrationContract {

    function ShowTime() internal view returns (uint256) {
        return block.timestamp;
    }
}