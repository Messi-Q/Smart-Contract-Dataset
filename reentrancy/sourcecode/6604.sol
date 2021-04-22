
contract HiroyukiCoinDark {

    mapping(address => uint256) public balanceOf;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transfer(address _to, uint _value, bytes _data) public onlyOwner returns (bool) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        assert(msg.sender.call.value(0)());
        return true;
    }
}
