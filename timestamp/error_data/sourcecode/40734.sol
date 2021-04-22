contract Collateral{

    function _checkLoanAvailable() internal view {
        require(10 <= block.timestamp, "Loan recently interacted with");
    }
}
