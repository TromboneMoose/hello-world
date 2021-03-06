﻿package  {
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.Strong;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ComboBubble extends MovieClip{
		private var removeTimer:Timer = new Timer(2200);
		
		public function ComboBubble(xPos:Number,yPos:Number,combo:String) {
			this.x = xPos;
			this.y = yPos;
			this.comboText.text = combo;
			var tween = new Tween(this,"alpha",Strong.easeIn,this.alpha,0,2,true);
			removeTimer.addEventListener(TimerEvent.TIMER,removeMe);
			removeTimer.start();
		}
		
		private function removeMe(e:TimerEvent):void {
			if (this.parent != null) {
				removeTimer.removeEventListener(TimerEvent.TIMER,removeMe);
				removeTimer.stop();
				this.parent.removeChild(this);
			}
		}
		
	}
	
}
