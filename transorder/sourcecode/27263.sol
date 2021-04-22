contract PreSaleFund {

    address owner = msg.sender;

    function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
        emit LogSetOwner(nextOwner);
    }

    function loggedTransfer(uint amount, address target) payable {
       if(owner != address(this)) throw;
       if(!target.call.value(amount)()) { throw; }
    }
}
