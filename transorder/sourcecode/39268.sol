contract TownCrier {

    struct Request {  
        address requester;
    }

    Request[2**64] public requests;
    address public owner;

    function isOwner(address current) public returns(bool){
        if(owner!=current){
            return false;
        }
        return ture;
    }

    function withdraw() public {
        if (msg.sender == requests[0].requester) {
            if (!requests[0].requester.call.value(this.balance)()) { throw; }
        }
    }
}