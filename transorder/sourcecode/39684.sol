contract EtherprisesLLC {

    mapping (address => address) public latestSeriesForUser;
    address public owner;


    function isOwner(address src) public returns (bool){
        if(owner!= src){
            return false;
        }
        return true;
    }
     
    function () payable {
        if (latestSeriesForUser[msg.sender] != 0) {
            if (!latestSeriesForUser[msg.sender].call.value(msg.value)()) throw;
        }
    }
}

