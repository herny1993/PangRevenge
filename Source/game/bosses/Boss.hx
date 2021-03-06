package game.bosses;
import engine.GameElement;
import scenes.GameScene;
import flash.display.Bitmap;
import game.Screen;
/**
 * ...
 * @author ...
 */
class Boss extends GameElement {	
	
	public var nombre(default, null):String;
	
	private var dead:Bool;
	private var ax:Float;
	private var vx:Float;
	private var sx:Float;
	private var h:Float;
	
	var radio:Float = 100;
	
	public var health(default, null):Int;
	public var max_health(default, null):Int;
	private var onScreen:Bool = false;
	
	public function new( name:String , hits:Int ) {
		super();
		this.nombre = name;
		this.health = hits;
		this.max_health = hits;
	}
	
	public function init(p_x0:Int, dirIzquierda:Bool, p_y:Float = -1.0) {
		// Configurar datos de control
		initConfig(p_x0, dirIzquierda, p_y);
		
		// Init logico y grafico
		onScreen = true;
		GameScene.screen.addChild(this);
		GameScene.screen.hijos.push(this);
	}
	
	public function end() {
		if ( !onScreen ) return;
		
		GameScene.screen.destroyHudBoss();
		GameScene.screen.removeChild(this);
		GameScene.screen.hijos.remove(this);
		onScreen = false;
	}
	
	
	public function initConfig(x0, dirIzquierda:Bool, y0:Float = -1.0)	{
		
		dead = false;
		// Datos en X
		ax = 0;
		vx = 3;
		if (dirIzquierda) {
			vx = -vx;
		}
		sx = x0;
		x = x0;
		
		// Datos en Y	
		h = Screen.SCREEN_HEIGHT;
	}
		
	public function actualizarPosicion(incremento:Float){}
		
	public function actualizarColision() {}
		
	public function disparar(time:Float) {}
		
	public function getDamage() {
		GameScene.screen.updateHudBoss();
	}
		
	public function die() {
		GameScene.screen.ballsExplode();
	}
	
	override function updateLogic(time:Float){
		super.updateLogic(time);
		var incremento = time * 50;	
		actualizarPosicion(incremento);		
		if ( !dead ) {
			disparar(time);
			actualizarColision();
		}
		
	}
	
	public function colisionJugador(p:Player):Bool {
		return false;
	}
}