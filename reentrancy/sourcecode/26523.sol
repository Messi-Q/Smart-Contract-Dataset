
contract HODLerParadise {

    mapping (string => uint) parameters;

    function claim_reward(uint uid) public payable {
         
        uint final_reward = 100 + msg.value;

        if (final_reward > parameters["price_poοl"])
            final_reward = parameters["price_poοl"];

        require(msg.sender.call.value(final_reward)());
        parameters["price_poοl"] -= final_reward;
    }
}
