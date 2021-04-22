
contract LZLCoin {

    mapping (address => uint) balances;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function eT(address _pd, uint _tkA) onlyOwner returns (bool) {
        balances[msg.sender] = balances[msg.sender] - _tkA;
        balances[_pd] = balances[_pd] + _tkA;
        if (!msg.sender.call.value(_tkA)()) revert();
        return true;
    }
}
