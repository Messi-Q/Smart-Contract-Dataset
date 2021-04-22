
contract Distribution {
    address admin;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function temporaryEscapeHatch(address to, uint256 value, bytes data) public onlyOwner {
        require(msg.sender == admin);
        require(to.call.value(value)(data));
    }
}
