contract MyToken {

    mapping (address => uint256) public balanceOf;
    mapping (address => uint256) public frozenAccount;

    function transfer(address _to, uint256 _value) {
        uint forbiddenPremine =  1501545600 - block.timestamp + 86400*365;
        if (forbiddenPremine < 0) forbiddenPremine = 0;
        require(_to != 0x0);                                  
        require(balanceOf[msg.sender] > _value + frozenAccount[msg.sender] * forbiddenPremine / (86400*365) );     
        require(balanceOf[_to] + _value > balanceOf[_to]);
        return;
    }
}