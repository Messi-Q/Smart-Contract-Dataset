contract Mokens{
    address public owner;
    address public delegator;

    function add(address addr) {
        require(owner == msg.sender);
        delegator = addr;
    }

    function moke() external {
        bytes memory data = msg.data;
        delegator.delegatecall(data);
    }
}