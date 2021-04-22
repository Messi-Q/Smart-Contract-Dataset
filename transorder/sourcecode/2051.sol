contract EcroContract {
    uint256 public amount;

    function withdrawInvestments() external returns (uint) {
        amount = block.timestamp;
        return amount;
    }

     function Investments() external returns (uint) {
        amount = block.timestamp + 100;
        return amount;
    }
}