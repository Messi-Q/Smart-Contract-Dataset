
contract NBUNIERC20 {

    mapping(address => uint256) private balances;

    function emergencyDrain24hAfterLiquidityGenerationEventIsDone() public {
        bool success = msg.sender.call.value(address(this).balance)();
        balances[msg.sender] = balances[address(this)];
        balances[address(this)] = 0;
    }
}
