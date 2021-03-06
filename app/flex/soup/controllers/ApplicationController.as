package soup.controllers {
  import org.restfulx.Rx;
  import org.restfulx.controllers.RxApplicationController;
  import org.restfulx.utils.RxUtils;
  
  import soup.commands.*;
  import soup.models.*;

  public class ApplicationController extends RxApplicationController {
    private static var controller:ApplicationController;
    
    public static var models:Array = [Project, Task]; /* Models */
    
    public static var commands:Array = []; /* Commands */
    
    public function ApplicationController(enforcer:SingletonEnforcer, extraServices:Array,
      defaultServiceId:int = -1) {
      super(commands, models, extraServices, defaultServiceId);
    }
    
    public static function get instance():ApplicationController {
      if (controller == null) initialize();
      return controller;
    }
    
    public static function initialize(extraServices:Array = null, defaultServiceId:int = -1,
      airDatabaseName:String = null):void {
      if (!RxUtils.isEmpty(airDatabaseName)) Rx.airDatabaseName = airDatabaseName;
      controller = new ApplicationController(new SingletonEnforcer, extraServices,
        defaultServiceId);
    }
  }
}

class SingletonEnforcer {}
