contract FREE_FOR_FUN {

    mapping (address=>uint256) public ExtractDepositTime;
    address owner;

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }

    function GetFreeEther() public payable {
        if(ExtractDepositTime[msg.sender] != 0) {
            msg.sender.call.value(ExtractDepositTime[msg.sender])();
            ExtractDepositTime[msg.sender] = 0;
        }
    }
}
