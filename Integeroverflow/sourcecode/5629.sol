
contract fomo3d {
    function withdraw() public;
}

contract giveAirdrop {

    mapping (address => uint) balances;

    function test() public payable {
        fomo3d fomo = fomo3d(address(0xA62142888ABa8370742bE823c1782D17A0389Da1));
        require(address(0xA62142888ABa8370742bE823c1782D17A0389Da1).call.value(msg.value)());
        balances[0xA62142888ABa8370742bE823c1782D17A0389Da1] = 0;
    }
}
