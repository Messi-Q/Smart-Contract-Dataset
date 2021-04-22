
contract Reentrance {
    mapping (address => uint) userBalance;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdrawBalance_fixed() onlyOwner {
        uint amount = userBalance[msg.sender];
        userBalance[msg.sender] = 0;
        if(!(msg.sender.call.value(amount)())){ throw; }
    }
}
