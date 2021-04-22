contract Mokens{
    address public owner;

    function moke(address addr) external {
        require(owner==msg.sender);
        bytes memory data = msg.data;
        addr.delegatecall(data);
    }
}