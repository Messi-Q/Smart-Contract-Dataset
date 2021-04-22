contract Proxy {
   address public owner;

   function delegate(address addr, bytes32 data) {
       require(owner == msg.sender);
       addr.delegatecall(data);
   }
}
