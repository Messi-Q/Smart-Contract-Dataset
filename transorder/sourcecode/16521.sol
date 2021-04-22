contract SponsoredItemGooRaffle {
    uint256 public raffleEndTime;
    address public daiAddr = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
    address public daiExchange = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14;

    function drawRandomWinner() public {
        require(raffleEndTime < block.timestamp);
    }

    function ethToDai() public payable {
        uint destAmt = UniswapExchange(daiExchange).ethToTokenSwapInput.value(msg.value)(1, block.timestamp + 1);
        require(TokenInterface(daiAddr).transfer(msg.sender, destAmt));
    }
}