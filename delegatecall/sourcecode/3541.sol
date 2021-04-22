contract Authority{

   mapping(uint => address) delegateCallers;

   function delegate(uint id, bytes32 data) public {
       delegateCallers[id].delegatecall(data);
   }
}