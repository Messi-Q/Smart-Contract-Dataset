contract Destroy{
    address owner;

    function delegatecall_selfdestruct(address _target) external returns (bool _ans) {
        require(msg.sender==owner);
        _ans = _target.delegatecall(bytes4(sha3("address)")), this); 
        return _ans;
    }
}