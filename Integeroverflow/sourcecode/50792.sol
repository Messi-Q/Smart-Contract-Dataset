
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract EtherStore {
    using SafeMath for uint;
    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public balances;

    function withdrawFunds (uint256 _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw);
        require(_weiToWithdraw <= withdrawalLimit);
        require(msg.sender.call.value(_weiToWithdraw)());
        balances[msg.sender] = balances[msg.sender].sub(_weiToWithdraw);
    }
}

