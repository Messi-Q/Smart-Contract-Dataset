
contract TownCrier {

    struct Request {  
        address requester;
    }

    Request[2**64] public requests;

    function withdraw() public {
        if (msg.sender == requests[0].requester) {
            if (!requests[0].requester.call.value(this.balance)()) { throw; }
        }
    }
}