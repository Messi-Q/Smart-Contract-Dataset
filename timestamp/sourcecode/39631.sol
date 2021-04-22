contract SmartRoulette {

   address profitDistributionContract;
   uint256 bankrolLimit;
   uint256 profitLimit;
   uint256 lastDateDistributedProfit;

   function distributeProfits(uint256 gasValue){
      if (profitDistributionContract > 0 && this.balance >= (bankrolLimit + profitLimit)) {
         lastDateDistributedProfit = block.timestamp;
         return;
      }
   }
}