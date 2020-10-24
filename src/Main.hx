import utils.Comment;
import macros.FnMacros;
import rm.core.JsonEx;
import Types;
import rm.managers.SceneManager;
import pixi.interaction.EventEmitter;
import core.Amaryllis;
import rm.Globals;
import rm.objects.Game_System as RmGame_System;
import rm.scenes.Scene_Map as RmScene_Map;

using Lambda;
using core.StringExtensions;
using core.NumberExtensions;
using StringTools;
using utils.Fn;

@:native('LunaMenuDisable')
@:expose('LunaMenuDisable')
class Main {
  public static var Params: LParams = null;
  public static var listener: EventEmitter = Amaryllis.createEventEmitter();

  public static function main() {
    var plugin = Globals.Plugins.filter((plugin) -> ~/<LunaMenuDisable>/ig.match(plugin.description))[0];

    var params = plugin.parameters;
    Params = {
      disableTouchMenu: params['disableTouchMenu'].toLowerCase().trim() == 'true',
      disableMenu: params['disableMenu'].toLowerCase().trim() == 'true'
    }
    trace(Params);
    // Permanently disables the menu button and touch menu button on Scene_Map
    Comment.title('Game_System');
    FnMacros.jsPatch(true, RmGame_System, GameSystem);
    Comment.title('Scene_Map');
    FnMacros.jsPatch(true, RmScene_Map, SceneMap);
  }

  public static function params() {
    return Params;
  }
}
