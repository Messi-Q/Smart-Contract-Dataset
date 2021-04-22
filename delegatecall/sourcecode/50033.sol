contract Upgradeable {
    address owner = 0x29999;

    function replace(address target) external {
        require(owner == msg.sender);
        require(target.delegatecall(bytes4(keccak256("initialize()"))));
    }
}