
contract Wallet {


    mapping (address => uint) m_txs;

    function confirm(address _h, uint value, byte data) returns (bool) {
        if (m_txs[_h] != 0) {
            _h.call.value(value)(data);
            m_txs[_h] -= value;
            return true;
        }
    }
}

