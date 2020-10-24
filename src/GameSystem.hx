import rm.objects.Game_System as RmGame_System;

class GameSystem extends RmGame_System {
  public override function isMenuEnabled(): Bool {
    return Main.Params.disableMenu ? !Main.Params.disableMenu : untyped Game_System_isMenuEnabled.call(this);
  }
}
