/* HackHaste main + left-hand. ANSI positions. Caps Lock scancode = Left Control.
 * Layer 0: haha. Layer 1: haha-left (geometric swap).
 * Matrix is LAYOUT_65_ansi. Reorder into a board matrix; do not assume electrical order.
 */
#include QMK_KEYBOARD_H

enum layers { _HAHA, _HAHA_LEFT };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_HAHA] = LAYOUT_65_ansi(
        KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_LBRC, KC_RBRC, KC_V,    KC_X,    KC_Z,    KC_Q,    KC_BSPC, KC_DEL,
        KC_TAB,  KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_K,    KC_L,    KC_C,    KC_G,    KC_Y,    KC_W,    KC_SCLN, KC_BSLS, KC_HOME,
        KC_LCTL, KC_U,    KC_I,    KC_A,    KC_E,    KC_O,    KC_H,    KC_R,    KC_S,    KC_T,    KC_N,    KC_P,             KC_ENT,  KC_PGUP,
        KC_LSFT,          KC_QUOT, KC_COMM, KC_DOT,  KC_SLSH, KC_EQL,  KC_J,    KC_M,    KC_D,    KC_B,    KC_F,    KC_RSFT, KC_UP,   KC_PGDN,
        KC_LCTL, KC_LGUI, KC_LALT,                            KC_SPC,                    KC_RALT, MO(_HAHA_LEFT), KC_LEFT, KC_DOWN, KC_RGHT
    ),
    [_HAHA_LEFT] = LAYOUT_65_ansi(
        KC_GRV,  KC_X,    KC_V,    KC_Z,    KC_Q,    KC_W,    KC_SCLN, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_BSPC, KC_DEL,
        KC_TAB,  KC_P,    KC_G,    KC_C,    KC_L,    KC_K,    KC_MINS, KC_7,    KC_8,    KC_9,    KC_0,    KC_LBRC, KC_RBRC, KC_BSLS, KC_HOME,
        KC_LCTL, KC_N,    KC_T,    KC_S,    KC_R,    KC_H,    KC_O,    KC_E,    KC_A,    KC_I,    KC_U,    KC_Y,             KC_ENT,  KC_PGUP,
        KC_LSFT,          KC_F,    KC_B,    KC_D,    KC_M,    KC_J,    KC_EQL,  KC_QUOT, KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT, KC_UP,   KC_PGDN,
        KC_LCTL, KC_LGUI, KC_LALT,                            KC_SPC,                    KC_RALT, _______, KC_LEFT, KC_DOWN, KC_RGHT
    )
};
