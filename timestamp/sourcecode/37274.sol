contract MyToken {

    mapping (address => uint256) public balanceOf;
    mapping (address => uint256) public restFinish;

    function rest()  returns (bool success){    
        require(balanceOf[msg.sender] >= 5000);          
        balanceOf[msg.sender] -= 5000;
        restFinish[msg.sender] = block.timestamp + 3 days;
        return true; 
    }
}