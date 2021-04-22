contract Vault {
    address public owner;
    uint public withdrawTime;
    uint public withdrawAmount;
    modifier onlyOwner() {
        if(msg.sender != owner) throw;
        _;
    }

    function withdraw() onlyOwner {
        if(block.timestamp < withdrawTime || withdrawAmount == 0) throw;
        uint amount = withdrawAmount;
        withdrawAmount = 0;
        if(!owner.send(amount)) throw;
        return;
    }
}