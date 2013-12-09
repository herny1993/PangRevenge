package engine;

import flash.display.Stage;
import flash.events.KeyboardEvent;

class InputManager {
	
	var teclas:Array<Bool>;	
	
	public static var config:Map<String,Int> = null;
	public static inline var LEFT_ARROW:Int = 37;
	public static inline var RIGHT_ARROW:Int = 39;
	
	public function new () {
		teclas=new Array<Bool>();
		
		config = new Map<String, Int>();
		
		// Teclas jugador 1
		config.set("P1_LEFT", LEFT_ARROW);
		config.set("P1_RIGHT", RIGHT_ARROW);
		config.set("P1_FIRE", "Z".charCodeAt(0));
		config.set("P1_JUMP", "X".charCodeAt(0));		
		
		// Teclas jugador 2
		config.set("P2_LEFT", "J".charCodeAt(0));
		config.set("P2_RIGHT", "L".charCodeAt(0));
		config.set("P2_FIRE", "Q".charCodeAt(0));
		config.set("P2_JUMP", "W".charCodeAt(0));
		
		config.set("PAUSE", "P".charCodeAt(0));
		config.set("DEBUG_END_LEVEL", "N".charCodeAt(0));
		config.set("DEBUG_UNLOCK_SCENES", "U".charCodeAt(0));
	}
	
	// Suscribirse a los Eventos del Teclado
	public function suscribe(stage:Stage){
		stage.addEventListener(flash.events.KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	// Cuando se Suelta una Tecla
    private function onKeyUp(event:KeyboardEvent){
    	teclas[event.keyCode]=false;
    }

	// Cuando se Presiona una Tecla
    private function onKeyDown(event:KeyboardEvent){
		teclas[event.keyCode]=true;
    }
    
	// Saber si una tecla esta presionada
    public function keyPressed(key:String):Bool{
    	return teclas[key.charCodeAt(0)];    
    }
	   
	public function keyCodePressed(keyCode:Int):Bool{
    	return teclas[keyCode];    
    }	
    
}
