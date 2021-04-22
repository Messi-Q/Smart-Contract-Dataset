contract HorseyPilot {
    struct Proposal{
        uint256 timestamp;
        uint256 parameter;
    }
    Proposal public currentProposal;
    bool public proposalInProgress = false;

    function makeProposal(uint256 parameter) external {
        currentProposal.timestamp = block.timestamp;
        currentProposal.parameter = parameter;
        proposalInProgress = true;
    }
}