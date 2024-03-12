package simplehudtoggle {
import common.BaseControl;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

public class SimpleHUDToggle extends BaseControl {

	private var m_modifierKey:String = "control";
	private var m_mainKeyCode:uint = Keyboard.F2;

	public function SimpleHUDToggle() {
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}

	private function onAdded(event:Event):void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	private function onKeyDown(event:KeyboardEvent):void {
		var modifierPressed:Boolean = (m_modifierKey == "control" && event.ctrlKey) ||
				(m_modifierKey == "alt" && event.altKey) ||
				(m_modifierKey == "none" && !event.ctrlKey && !event.altKey);

		if (modifierPressed && event.keyCode == m_mainKeyCode) {
			Send_ToggleHUD();
		}
	}

	public function onSetData(object:Object):void {
		if (object.hasOwnProperty("modifier")) {
			m_modifierKey = object.modifier;
		}
		if (object.hasOwnProperty("key")) {
			m_mainKeyCode = object.key;
		}
	}

	public function Send_ToggleHUD():void {
		sendEvent("ToggleHUD");
	}
}
}
