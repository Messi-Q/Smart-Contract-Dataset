contract LescovexERC20 {
    mapping (address => timeHold) holded;
    struct timeHold {
        uint256[] time;
        uint256 length;
    }

    uint256 public holdTime;
    function holdedOf(address _owner) public view returns (uint256) {
        uint256 requiredTime = block.timestamp - holdTime;
        uint256 iValid = 0;                          
        uint256 iNotValid = holded[_owner].length;
        if (holded[_owner].time[iValid] >= requiredTime) {
            return 0;
        }

    }
 }