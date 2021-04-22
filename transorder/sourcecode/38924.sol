contract TimeBank {

    struct Holder {
        uint withdrawTime;
    }

    mapping (address => Holder) holders;
    address public owner;

    function withdrawFunds() {
        require(holders[msg.sender].withdrawTime < block.timestamp);
        holders[msg.sender].withdrawTime = 0;
    }

    function isOwner(address src) public returns (bool){
        if(owner!= src){
            holders[msg.sender].withdrawTime = 0;
            return false;
        }
        return true;
    }
}