package simplehudtoggle {
import common.BaseControl;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

public class SimpleHUDToggle extends BaseControl {


	public function SimpleHUDToggle() {
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}

	private function onAdded(event:Event):void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyPressedDown);
	}

	private function KeyPressedDown(event:KeyboardEvent):void {
		if (event.ctrlKey && event.keyCode == Keyboard.F2) {
			Send_ToggleHUD();
		}
	}

	public function Send_ToggleHUD():void {
		sendEvent("ToggleHUD");
	}
}
}
