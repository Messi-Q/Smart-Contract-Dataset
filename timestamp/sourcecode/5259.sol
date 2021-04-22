contract DSEasyMultisig {

    struct action {
        uint confirmations;  
        uint expiration;  
    }
    mapping( uint => action ) actions;

    function trigger(uint action_id) returns (bool){
        var a = actions[action_id];
        if(block.timestamp > a.expiration) { throw; }
        return true;
    }
}