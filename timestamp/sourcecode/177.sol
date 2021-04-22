contract IcoRocketFuel {
    enum States {Closed}

    struct Crowdsale {
        uint256 closingTime;
        bool earlyClosure;     
        States state;
    }

    mapping(address => Crowdsale) public crowdsales;
     
    function finalize(address _token) external {
        require(crowdsales[_token].earlyClosure || (block.timestamp >= crowdsales[_token].closingTime));
        crowdsales[_token].state = States.Closed;
    }
}