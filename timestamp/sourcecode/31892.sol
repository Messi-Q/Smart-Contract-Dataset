contract Fund {
    uint32 internal refundDate;

    function enableRefund() public{
        uint32 time = uint32(block.timestamp);
        require(refundDate > time);
        refundDate = time;
        return;
    }
}