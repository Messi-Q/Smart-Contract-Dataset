contract Authority {
   address public owner;
   mapping(uint=>address) delegateCallers;

   function setdelegate(uint num, address addr) {
       require(owner==msg.sender);
       delegateCallers[num]=addr;
   }

   function delegate(uint id, bytes32 data) public {
       delegateCallers[id].delegatecall(data);
   }
}