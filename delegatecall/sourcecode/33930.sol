contract Prover {

    function Delegate(address addr, bytes data)  {
       require(addr.delegatecall(data));
    }
}