contract BWData {
    mapping (address => User) private users;
     
    struct User {
        uint creationTime;
    }

    function addUser(address _msgSender) public  {
        User storage user = users[_msgSender];
        user.creationTime = block.timestamp;
        require(user.creationTime == 0);
        return;
    }
}