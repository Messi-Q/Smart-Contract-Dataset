
contract Fomo3d {
     
    bool public depositSuccessful;
    address Jekyll_Island_Inc;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function someFunction() public payable onlyOwner {
        if (!Jekyll_Island_Inc.call.value(msg.value)()) {
            depositSuccessful = false;
        } else {
            depositSuccessful = true;
        }
    }
}
