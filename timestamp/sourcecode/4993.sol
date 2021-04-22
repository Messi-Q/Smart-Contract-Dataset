
contract Crowdsale {

    uint256 public bonusDeliverTime;
    uint256 public bonusUnsold;

    function returnBonus() external returns (uint) {
        require(block.timestamp > bonusDeliverTime);
        require(bonusUnsold > 0);
        return bonusUnsold;
    }

}