contract IcoRocketFuel {

    struct crowdsale {
        uint256 closingTime;
    }
    crowdsale crowdsales;

    function finalize() external {
        require((block.timestamp >= crowdsales.closingTime));
    }
}