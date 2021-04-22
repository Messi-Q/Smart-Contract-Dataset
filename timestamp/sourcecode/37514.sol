contract PrimasToken{
    bool  public transfersEnabled = true;
    mapping (address => uint) jail;

    function transferFrom(address _from, address _to, uint256 _value) returns (bool) {
        if (!transfersEnabled) revert();
        if (jail[msg.sender] >= block.timestamp || jail[_to] >= block.timestamp || jail[_from] >= block.timestamp ) revert();
        else return true;
    }
}