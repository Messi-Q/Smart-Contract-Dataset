contract BirthdayGift {
    address public recipient;
    uint public birthday;

    function Take () {
        if (msg.sender != recipient) throw;
        if (block.timestamp < birthday) throw;
    }

    function withdraw() public returns(bool){
        if(birthday != block.timestamp){
            return false;
        }
        return true;
    }
}