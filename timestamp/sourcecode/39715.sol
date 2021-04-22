contract LegendsCrowdfund {
    uint public start;
    uint public limitVIP;
    mapping (address => uint) public recipientVIP;
    uint public totalVIP;


    function purchaseMembership(address recipient) external payable returns(uint){
        uint VIP = msg.value * 10;
        if (block.timestamp - start < 2 weeks) {
            VIP = (VIP * 10) / 9;
        }
        recipientVIP[recipient] += VIP;
        totalVIP += VIP;
        if (totalVIP > limitVIP) { throw; }
        return VIP;
    }
}