contract Crowdsale {
    uint256 constant public MAXSALESCAP = 126000 ether;
    uint256 public weiRaised;


    function buyTokens() public payable returns (bool) {
        if (weiRaised >= MAXSALESCAP) {
            return false;
        }
        return true;
    }
}