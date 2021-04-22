contract UnitedfansTokenCrowdsale {
    enum State { BeforeSale, NormalSale, ShouldFinalize, SaleOver }
    State public state = State.BeforeSale;
    uint256 public endTime;

    function finalization() internal {
        endTime = block.timestamp;
        state = State.SaleOver;
        return;
    }
}