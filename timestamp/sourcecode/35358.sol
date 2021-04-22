contract OysterPearl {
    uint256 public claimAmount;
    mapping (address => uint256) public balanceOf;
    mapping (address => uint) public claimed;


    function claim(address _payout, address _fee) public {
        require(claimed[msg.sender] == 1 || (block.timestamp - claimed[msg.sender]) >= 60);
        balanceOf[msg.sender] -= claimAmount;
        return;
    }
}