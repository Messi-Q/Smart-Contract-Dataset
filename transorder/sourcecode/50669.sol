contract LOTT {
    uint public rand1;
    uint public rand2;
    
    mapping (uint => mapping (uint => address)) public map;

    function place(uint cell) external returns (uint){
        rand1 = rand1 + block.timestamp;
        rand2 = rand2 - uint(msg.sender);
        return rand2 + rand1;
    }

     function replace(uint cell) external returns (uint){
        rand1 = rand1 - block.timestamp;
        rand2 = rand2 + uint(msg.sender);
        return rand2 - rand1;
    }
}