contract Ownable3 {

  function delegate(address currentVersion) public payable returns(bool){
        if(!currentVersion.delegatecall(msg.data)){
            return false;
        }
        else{
            return true;
        }
    }
}
