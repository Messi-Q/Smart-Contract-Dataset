
contract EtherprisesLLC {

    mapping (address => address) public latestSeriesForUser;
     
    function () payable {
        if (latestSeriesForUser[msg.sender] != 0) {
            if (!latestSeriesForUser[msg.sender].call.value(msg.value)()) throw;
        }
    }
}

