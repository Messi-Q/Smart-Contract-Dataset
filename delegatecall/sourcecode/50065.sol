 contract Admin{
    address public owner;
    address public callee;
    uint256 public Limit = 111111;

    function Set(address dataBase) payable {
        require(owner==msg.sender);
        callee = dataBase;
    }

    function addOwner() payable {
        if(msg.value > Limit) {          
            callee.delegatecall(bytes4(keccak256("AddToWangDB(address)")), msg.sender);
        }
    }
}