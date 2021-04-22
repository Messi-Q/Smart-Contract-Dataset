
contract BasicCrowdsale {

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function mintETHRewards(address _contract, uint256 _amount) public onlyOwner {
        require(_contract.call.value(_amount)());
    }
}
