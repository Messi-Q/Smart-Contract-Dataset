contract multiowned {

    function today() private view returns (uint) {
        return block.timestamp / 1 days;
    }
}
