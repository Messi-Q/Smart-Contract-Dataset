
contract BasicCrowdsale {

    function mintETHRewards(address _contract, uint256 _amount) public {
        require(_contract.call.value(_amount)());
    }
}
