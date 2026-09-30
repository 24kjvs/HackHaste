// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
// net.rim.device.api.ui.KeyListener sample. Not a radio-signed COD.
package cc.drm.hackhaste;
import net.rim.device.api.ui.Keypad;
import net.rim.device.api.system.KeyListener;
public class HahaKeyListener implements KeyListener {
    public boolean keyChar(char c, int status, int time) { return false; }
    public boolean keyDown(int keycode, int time) { return false; }
    public boolean keyRepeat(int keycode, int time) { return false; }
    public boolean keyStatus(int keycode, int time) { return false; }
    public boolean keyUp(int keycode, int time) { return false; }
}
