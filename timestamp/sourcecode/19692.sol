
interface Token3DAPP {
    function transfer(address receiver, uint amount);
}

contract PreSale3DAPP {

    Token3DAPP public tokenReward; 
    uint256 public deadline;

    function PreSale3DAPP(address _tokenReward) {
        tokenReward = Token3DAPP(_tokenReward);  
        deadline = block.timestamp + (2 weeks);
        return;
    }
}