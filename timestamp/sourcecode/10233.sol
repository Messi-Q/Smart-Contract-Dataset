contract EthTeamContract {
    uint64 public finishTime;
    address public feeOwner;

    function finish() public {
        require(block.timestamp >= finishTime);
        feeOwner.transfer(address(this).balance);
    }
}