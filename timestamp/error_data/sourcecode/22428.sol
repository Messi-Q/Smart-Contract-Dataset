contract BBTCToken {

    uint64 private constant crowdSaleStart = 1526927400;

      function currentTierDiscountPercentage() internal view returns (uint64) {
          uint64 _now = uint64(block.timestamp);
          if(_now > crowdSaleStart) return 0;
          return 0;
      }
}