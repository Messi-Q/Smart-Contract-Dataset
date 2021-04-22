contract IcoRocketFuel {

    struct Crowdsale {
        uint256 closingTime;
    }
    mapping(address => Crowdsale) public crowdsales;
     
    function finalize(address _token) external {
        require((block.timestamp >= crowdsales[_token].closingTime));
    }
}