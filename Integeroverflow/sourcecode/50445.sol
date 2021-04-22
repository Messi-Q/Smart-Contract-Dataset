
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract NGOTVesting {
    using SafeMath for uint;
    mapping(address => uint256) public stageSettings;

    function vestStage(uint256 lockStartTime) public view returns(uint256){
        uint256 stage = block.timestamp.sub(lockStartTime);

        if(stage > stageSettings[msg.sender]){
            stage = stageSettings[msg.sender];
        }
        return stage;
    }
}