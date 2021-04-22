contract ANSAToken {
   uint256 public tradeStartTime;

   function hasTrade() public view returns (bool) {
      return block.timestamp > tradeStartTime;
   }
}