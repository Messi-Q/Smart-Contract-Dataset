contract Proxiable {

    function _replaceContract(address _target) internal {  
        require(_target.delegatecall(0xc4d66de8, _target), "Proxiable::_replaceContract: failed");
    }
}