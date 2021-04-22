contract ESS {
    address public token;
    mapping (address => uint256) public sold;
    uint256 public pubEnd = 0;

    function withdrawPUB() public returns(bool){
        require(block.timestamp > pubEnd);
        bool result = token.call(bytes4(keccak256("transfer(address,uint256)")), msg.sender, sold[msg.sender]);
        return result;
    }
}