
contract MilestoneTracker {

    struct Milestone {
        address paymentSource;
    }

    Milestone[] public milestones;


    function authorizePayment(uint _idMilestone) internal {
        Milestone milestone = milestones[_idMilestone];
        if (!milestone.paymentSource.call.value(0)()) throw;
    }
}