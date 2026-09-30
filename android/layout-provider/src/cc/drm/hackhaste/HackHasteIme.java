package cc.drm.hackhaste;

import android.inputmethodservice.InputMethodService;
import android.inputmethodservice.Keyboard;
import android.inputmethodservice.KeyboardView;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

/** Glass HackHaste. Physical USB/Bluetooth still uses the .kcm overlay. */
public class HackHasteIme extends InputMethodService
        implements KeyboardView.OnKeyboardActionListener {
    private KeyboardView board;
    private Keyboard haha;
    private Keyboard hahaLeft;
    private Keyboard current;
    private boolean shifted;

    @Override
    public View onCreateInputView() {
        board = (KeyboardView) getLayoutInflater().inflate(R.layout.input, null);
        haha = new Keyboard(this, R.xml.haha);
        hahaLeft = new Keyboard(this, R.xml.haha_left);
        current = haha;
        board.setKeyboard(current);
        board.setOnKeyboardActionListener(this);
        board.setPreviewEnabled(false);
        return board;
    }

    @Override
    public void onStartInputView(EditorInfo info, boolean restarting) {
        String extra = "";
        if (getCurrentInputMethodSubtype() != null) {
            extra = getCurrentInputMethodSubtype().getExtraValue();
        }
        current = extra != null && extra.contains("haha_left") ? hahaLeft : haha;
        board.setKeyboard(current);
        shifted = false;
    }

    @Override
    public void onPress(int primaryCode) {}

    @Override
    public void onRelease(int primaryCode) {}

    @Override
    public void onKey(int primaryCode, int[] keyCodes) {
        InputConnection ic = getCurrentInputConnection();
        if (ic == null) {
            return;
        }
        if (primaryCode == -5) {
            ic.deleteSurroundingText(1, 0);
            return;
        }
        if (primaryCode == -1) {
            shifted = !shifted;
            board.setShifted(shifted);
            return;
        }
        if (primaryCode == 10) {
            ic.sendKeyEvent(new android.view.KeyEvent(
                android.view.KeyEvent.ACTION_DOWN, android.view.KeyEvent.KEYCODE_ENTER));
            ic.sendKeyEvent(new android.view.KeyEvent(
                android.view.KeyEvent.ACTION_UP, android.view.KeyEvent.KEYCODE_ENTER));
            return;
        }
        char ch = (char) primaryCode;
        if (shifted && current != null) {
            for (Keyboard.Key key : current.getKeys()) {
                if (key.codes != null && key.codes.length > 0
                        && key.codes[0] == primaryCode
                        && key.popupCharacters != null
                        && key.popupCharacters.length() > 0) {
                    ch = key.popupCharacters.charAt(0);
                    break;
                }
            }
        } else if (shifted && Character.isLetter(ch)) {
            ch = Character.toUpperCase(ch);
        }
        ic.commitText(String.valueOf(ch), 1);
        if (shifted && primaryCode != -1) {
            shifted = false;
            board.setShifted(false);
        }
    }

    @Override
    public void onText(CharSequence text) {
        InputConnection ic = getCurrentInputConnection();
        if (ic != null && text != null) {
            ic.commitText(text, 1);
        }
    }

    @Override
    public void swipeLeft() {}
    @Override
    public void swipeRight() {}
    @Override
    public void swipeDown() {}
    @Override
    public void swipeUp() {}
}
