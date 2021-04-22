
contract ERC20 {
  function balanceOf(address to) public returns (uint256);
}

contract TokenLocker {
    
    ERC20 public token = ERC20(0x611171923b84185e9328827CFAaE6630481eCc7a);
    uint256 public releaseTimeFund = 1537833600;  
    uint public ReserveFundAmount = 18600000 ether;
    
    function unlockFund () public returns (bool){
        require(releaseTimeFund <= block.timestamp);
        require(ReserveFundAmount > 0);
        uint tokenBalance = token.balanceOf(this);
        require(tokenBalance >= ReserveFundAmount);
        return false;
    }
}