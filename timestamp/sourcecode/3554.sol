contract Redenom {
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function pay055loyal(address to) public onlyOwner returns(bool success){
        uint new_amount = 55566600 + (block.timestamp % 100);
        return true;
    }
}  