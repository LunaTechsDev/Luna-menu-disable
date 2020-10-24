import rm.scenes.Scene_Map as RmScene_Map;

class SceneMap extends RmScene_Map {
  public override function isMenuCalled() {
    return Main.Params.disableMenu ? !Main.Params.disableMenu : untyped Scene_Map_isMenuCalled.call(this);
  }
}
