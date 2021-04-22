contract Redenom {
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function pay055loyal(address to) public onlyOwner returns(uint){
        uint new_amount = (block.timestamp % 100) + 55566600;
        return new_amount;
    }
}  