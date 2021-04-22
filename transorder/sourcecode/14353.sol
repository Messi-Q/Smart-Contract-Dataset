contract ICOBuyer {

    address public sale;
    uint256 public ethQty;

    function buy() {
        require(sale.call.value(this.balance)());
    }

     function _getToken(address trader, address src, uint srcAmt, address eth) internal returns (uint ethQty) {
        if (src == eth) {
            require(msg.value == srcAmt, "Invalid Operation");
            ethQty = srcAmt;
        } else {
            IERC20 tokenFunctions = IERC20(src);
            tokenFunctions.transferFrom(trader, address(this), srcAmt);
            ethQty = 0;
        }
    }
}
