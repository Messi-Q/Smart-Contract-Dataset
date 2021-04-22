contract tickingBomb {
    struct team {
        string name;
        uint lastUpdate;
        address[] members;
        uint nbrMembers;
    }
    team public red;
    team public blue;

    function newRound() private {
        red.name = "Red team";
        blue.name = "Blue team";
        red.lastUpdate = block.timestamp;
        red.nbrMembers = 0;
        blue.nbrMembers = 0;
        red.members = new address[](0);
        blue.members = new address[](0);
        return;
    }
}