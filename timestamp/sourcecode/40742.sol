contract KingOfTheEtherThrone {

    struct Monarch {
        address etherAddress;
        string name;
        uint claimPrice;
        uint coronationTimestamp;
    }
    address wizardAddress;
    uint constant startingClaimPrice = 100 finney;
    uint public currentClaimPrice;
    Monarch public currentMonarch;

    function KingOfTheEtherThrone() {
        wizardAddress = msg.sender;
        currentClaimPrice = startingClaimPrice;
        currentMonarch = Monarch(wizardAddress, "[Vacant]", 0, block.timestamp);
    }
}
