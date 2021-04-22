contract Lottery{
    uint256 winningNumber;

   function resetLottery() internal returns (bool){
       winningNumber = uint256(keccak256(block.timestamp, block.difficulty)) % 300;
       return true;
   }
}
