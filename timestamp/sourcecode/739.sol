contract Crowdsale {
    uint256 constant public MAXSALESCAP = 126000 ether;
    uint256 public weiRaised;

    enum State { Funded }
    State public state;

    function buyTokens() public payable returns (bool success) {
        if (weiRaised >= MAXSALESCAP || block.timestamp >= MAXSALESCAP) {
            state = State.Funded;
        }
        return true;
    }
}