contract EtherStore {
    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public balances;
    address public owner;

    function withdrawFunds (uint256 _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw);
        require(_weiToWithdraw <= withdrawalLimit);
        require(msg.sender.call.value(_weiToWithdraw)());
        balances[msg.sender] = balances[msg.sender].sub(_weiToWithdraw);
    }

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }
}

