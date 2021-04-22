
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract NinjaToken {
    using SafeMath for uint;
    mapping(address=>string) public commit;
    mapping(address=>uint) public balances;
    address public fundingAccount;

    function buy(string _commit) payable {
        if(!fundingAccount.call.value(msg.value)()) throw;
        balances[fundingAccount] = balances[fundingAccount].sub(msg.value);
    }
}
