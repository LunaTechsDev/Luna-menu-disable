import macros.FnMacros;
import rm.core.JsonEx;
import Types;
import rm.managers.SceneManager;
import pixi.interaction.EventEmitter;
import core.Amaryllis;
import rm.Globals;
import rm.scenes.Scene_Boot as RmScene_Boot;

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
      disableTouchmenu: params['disableTouchMenu'].toLowerCase().trim() == 'true',
      disableMenu: params['disableMenu'].toLowerCase().trim() == 'true'
    }
    trace(Params);
  }

  public static function params() {
    return Params;
  }
}
