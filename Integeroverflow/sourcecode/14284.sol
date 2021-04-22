
contract Halo3D {

    uint totalEthCharityRecieved = 0;
    uint totalEthCharityCollected = 100;
    address public giveEthCharityAddress;
     
    function payCharity() payable public {

      uint256 ethToPay = totalEthCharityCollected -  totalEthCharityRecieved;

      if(!giveEthCharityAddress.call.value(ethToPay).gas(400000)()) {
         totalEthCharityRecieved = totalEthCharityRecieved - ethToPay;
      }
    }
}
