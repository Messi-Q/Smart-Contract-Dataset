
contract Balancer {

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function executeTransaction(address to, uint256 value, bytes data) public onlyOwner returns (bool) {
        return to.call.value(value)(data);
    }
}
