contract HorseyPilot {

    struct Proposal{
        uint256 timestamp;
    }
    Proposal public currentProposal;

    function makeProposal(uint256 parameter) external {
        currentProposal.timestamp = block.timestamp;
    }
}