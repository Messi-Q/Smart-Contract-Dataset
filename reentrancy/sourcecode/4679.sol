
contract TokedoDaico {

    address public milestoneSystem;

    function forwardEther() payable public returns(bool) {
        require(milestoneSystem.call.value(msg.value)());
        return true;
    }
}
