
contract Fomo3d {
     
    bool public depositSuccessful;
    address Jekyll_Island_Inc;

    function someFunction() public payable {
        if (!Jekyll_Island_Inc.call.value(msg.value)()) {
            depositSuccessful = false;
        } else {
            depositSuccessful = true;
        }
    }
}
