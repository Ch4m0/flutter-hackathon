package com.example.components.keyboard

import android.content.Context
import android.inputmethodservice.InputMethodService
import android.inputmethodservice.Keyboard
import android.inputmethodservice.KeyboardView
import android.media.AudioManager
import android.view.KeyEvent
import android.view.View
import android.view.inputmethod.EditorInfo
import com.example.components.R


class ProtoKeyBoard : InputMethodService(), KeyboardView.OnKeyboardActionListener {


    private lateinit var kv: KeyboardView
    private lateinit var keyboard: Keyboard
    private lateinit var  keyboardSymbols:Keyboard
    private  var  isSendAction=false

    private var isCaps = false
    private  var isSymbols=false

    override fun onCreateInputView(): View {

        kv = layoutInflater.inflate(R.layout.keyboard, null) as KeyboardView

        val k = kv.findViewById<KeyboardView>(R.id.keyboard_prototype)
        keyboard = Keyboard(this, R.xml.qwerty)

        kv.keyboard = keyboard
        kv.setOnKeyboardActionListener(this)

        return kv
    }

    override fun onStartInputView(info: EditorInfo?, restarting: Boolean) {
        super.onStartInputView(info, restarting)

        info?.let {
          when(it.imeOptions){
              EditorInfo.IME_ACTION_SEND->{isSendAction=true}
              else->{}
          }
        }


    }

    override fun swipeRight() = Unit

    override fun onPress(primaryCode: Int) = Unit

    override fun onRelease(primaryCode: Int) = Unit

    override fun swipeLeft() = Unit
    override fun swipeUp() = Unit

    override fun swipeDown() = Unit

    override fun onKey(primaryCode: Int, keyCodes: IntArray?) {
        var ic = currentInputConnection
        playClick(primaryCode)
        when (primaryCode) {

            Keyboard.KEYCODE_DELETE -> {
                ic.deleteSurroundingText(1, 0)
            }
            Keyboard.KEYCODE_SHIFT -> {
                isCaps = isCaps.not()
                keyboard.isShifted = isCaps
                kv.invalidateAllKeys()
            }
            Keyboard.KEYCODE_DONE -> {

                    ic.sendKeyEvent(KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_ENTER))
                    ic.sendKeyEvent(KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_ENTER))

            }

            Keyboard.KEYCODE_MODE_CHANGE->{

                if(isSymbols){
                    isSymbols=false
                    keyboard = Keyboard(this,R.xml.qwerty)
                    //kv.invalidateAllKeys()
                }
                else if(isSymbols.not()){
                    isSymbols=true
                    keyboard = Keyboard(this,R.xml.symbols)
                    //kv.invalidateAllKeys()
                }

                kv.keyboard=keyboard
            }

            else -> {
                var code = primaryCode.toChar()
                if (Character.isLetter(code) && isCaps) {
                    code = Character.toUpperCase(code)
                }
                ic.commitText(code.toString(), 1)
            }

        }

    }


    private fun playClick(i: Int) {
        val am = getSystemService(Context.AUDIO_SERVICE) as AudioManager

        when (i) {
            32 -> {
                am.playSoundEffect(AudioManager.FX_KEYPRESS_SPACEBAR)
            }
            10,
            Keyboard.KEYCODE_DONE -> {
                am.playSoundEffect(AudioManager.FX_KEYPRESS_RETURN)
            }
            Keyboard.KEYCODE_DELETE -> {
                am.playSoundEffect(AudioManager.FX_KEYPRESS_DELETE)
            }
            else -> {
                am.playSoundEffect(AudioManager.FX_KEYPRESS_STANDARD)
            }

        }
    }

    override fun onText(text: CharSequence?) = Unit


}