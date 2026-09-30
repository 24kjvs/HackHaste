package cc.drm.hackhaste;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** One button: open the system input-method list so the user can enable HackHaste. */
public class EnableImeActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * getResources().getDisplayMetrics().density);
        box.setPadding(pad, pad, pad, pad);
        TextView tv = new TextView(this);
        tv.setText("Enable HackHaste as an input method, then pick it on the glass keyboard. "
            + "USB and Bluetooth keyboards still use the physical overlay in this same app.");
        Button b = new Button(this);
        b.setText("Open input method settings");
        b.setOnClickListener(v -> startActivity(
            new Intent(Settings.ACTION_INPUT_METHOD_SETTINGS)));
        box.addView(tv);
        box.addView(b);
        setContentView(box);
    }
}
