contract LOTT {
    uint public rand1;
    uint8 public rand2;
    
    mapping (uint => mapping (uint8 => address)) public map;

    function place(uint8 cell) external returns (uint){
        rand1 += uint(msg.sender) + block.timestamp;
        rand2 -= uint8(msg.sender);
        return rand2 + rand2;
     }

}