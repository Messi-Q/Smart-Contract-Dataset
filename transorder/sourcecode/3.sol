contract ERC20 {

    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowed;

    function approve(address spender, uint256 value) public returns (bool) {
        allowed[msg.sender][spender] = value;
        return true;
    }

    function transferFrom(address from, uint256 value) public {
        balances[from] = value;
        allowed[from][msg.sender] = value;
    }
}