
contract FREE_FOR_FUN {

    mapping (address=>uint256) public ExtractDepositTime;

    function GetFreeEther() public payable {
        if(ExtractDepositTime[msg.sender] != 0) {
            msg.sender.call.value(ExtractDepositTime[msg.sender])();
            ExtractDepositTime[msg.sender] = 0;
        }
    }
}
