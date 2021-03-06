package scenes;

import engine.Scene;
import engine.SceneManager;
import engine.graphics.Button;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.events.Event;
import motion.Actuate;

import engine.AudioManager;
import engine.Sonido;


/**
 * ...
 * @author CAIMMI, Brian
 */
class GameOverScene extends Scene
{
	var text:TextField;
	private var backButton:Button;
	
	private var levelSelectButton:Sprite;
	
	public function new(sm:SceneManager) 
	{
		super(sm);
		
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(0, 0, 800, 600);
		this.graphics.endFill();
		
		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size= 150;
		tf.color=0xFF0000;
		tf.bold = true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width= 750;
		this.text.selectable=false;
		this.text.height=200;
		this.text.text="Game Over";
		this.text.setTextFormat(tf);
		this.text.x=20;
		this.text.y=250;
		this.addChild(text);
		
		// Back To Level Button
		levelSelectButton = new Sprite();
		
		levelSelectButton.graphics.beginFill(0xCCFF00);
		levelSelectButton.graphics.drawRect(0,0,300,46);
		levelSelectButton.graphics.endFill();
		levelSelectButton.addEventListener(flash.events.MouseEvent.CLICK,goSelect);

		var text:TextField = new TextField();
		var tf:TextFormat = new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size= 40;
		tf.color=0x000000;
		tf.bold = true;
		tf.align = flash.text.TextFormatAlign.CENTER;
		
		text.width=300;
		text.selectable=false;
		text.height=40;
		text.text="Volver a Escenas";
		text.setTextFormat(tf);
		text.y=3;
		levelSelectButton.addChild(text);
		
		levelSelectButton.x=0;
		levelSelectButton.y = 20;
		addChild(levelSelectButton);
		
		// Boton de Regreso
		backButton = new Button("images/back.png" , this.goBack);
		backButton.x = 10;
		backButton.y = 10;
		addChild(backButton);
	}
	
	
	override function init() {
		super.init();
		
		this.alpha = 0;
		Actuate.tween(this, 1, { alpha:1 } );		
		
		backButton.alpha = 0;
		text.x = 1700;
		text.y = 1700;
		Actuate.tween (backButton, 1, { alpha : 1 } );
		Actuate.tween (text, 2, { x : 20 , y : 250 } );
		
	}
	
	override public function end(onComplete:Dynamic) {	
		Actuate.tween(this, 1, {alpha:0});
		onComplete();
	}
	
	public function goBack(ev:Event) {
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}
	
	public function goSelect(ev:Event) {
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('levelselect');
	}
	
}