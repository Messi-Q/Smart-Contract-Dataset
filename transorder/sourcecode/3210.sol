contract Fomo3d {
    bool public depositSuccessful;
    address Jekyll_Island_Inc;
    address public owner;

     function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
    }

    function someFunction() public payable {
        owner = Jekyll_Island_Inc;
        if (!owner.call.value(msg.value)()) {
            depositSuccessful = false;
        } else {
            depositSuccessful = true;
        }
    }
}