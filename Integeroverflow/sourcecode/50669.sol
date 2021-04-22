
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract LOTT {
    using SafeMath for uint;
    uint public rand1;
    uint public rand2;
    
    mapping (uint => mapping (uint => address)) public map;

    function place(uint cell) external returns (uint){
        rand1 = rand1.add(block.timestamp);
        rand2 = rand2.sub(uint(msg.sender));
        return rand2.add(rand2);
     }

}