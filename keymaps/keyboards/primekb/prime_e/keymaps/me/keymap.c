#include QMK_KEYBOARD_H
#include "custom-keycodes.h"

#define BASE 0
#define NAV  1
#define SYMB 2
#define NUM  3
#define CODE 4

#define LT_SYMB  LT(SYMB, KC_TAB)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [BASE] = LAYOUT(
QK_GESC, KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,              KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC, KC_DEL, \
LT_SYMB, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,              KC_H,    KC_J,    KC_K,    KC_L,    KC_QUOT, KC_ENT,  \
SC_LSPO, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    OSL(NUM), KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, SC_RSPC,  \
KC_LCTL, KC_LALT,                   KC_LGUI, MO(NAV), KC_SPC,            KC_UNDS,          KC_RALT,          MO(CODE)   \


),[NAV] = LAYOUT(
KC_BSPC, D_SUBWD, D_LIN_U, KC_UP,   D_EXPOS, D_CUR_U,           D_SPC_L, D_SPC_R, KC_UP,   KC_HOME, KC_PGUP, _______, _______, \
KC_ENT,  KC_LALT, KC_LEFT, KC_DOWN, KC_RGHT, D_CUR_D,           D_NXTWN, KC_LEFT, KC_DOWN, KC_RGHT, KC_PGDN, KC_PENT, \
KC_LSFT, KC_LGUI, D_LIN_D, D_SWAP,  D_ALF_V, D_CUR_N, D_TAB_L,  D_TAB_R, D_BACK,  D_SEL_W, D_FRWD,  KC_END,  _______,  \
KC_LCTL, KC_LALT,                   KC_LGUI, _______, KC_SPC,            KC_RGUI,          __xxx__,          __xxx__    \


),[SYMB] = LAYOUT(
KC_GRV,  KC_LT,   KC_GT,   KC_LBRC, KC_RBRC, Z_XTODO,           KC_AT,   KC_EXLM, KC_PIPE, KC_ASTR, KC_CIRC, _______, _______, \
_______, KC_TILD, KC_DLR,  KC_LCBR, KC_RCBR, KC_UNDS,           KC_HASH, KC_EQL,  KC_MINS, KC_PLUS, KC_GRV,  KC_PENT, \
KC_LSFT, KC_QUES, KC_BSLS, KC_LPRN, KC_RPRN, Z_ARROW, KC_PERC,  KC_AMPR, KC_DLR,  KC_SCLN, KC_COLN, KC_BSLS, KC_RSFT,  \
_______, _______,                   _______, _______, KC_SPC,            _______,          __xxx__,          __xxx__    \


),[NUM] = LAYOUT(
KC_0,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,              KC_AT,   KC_EXLM, KC_PIPE, KC_ASTR, __xxx__, _______, _______, \
__xxx__, KC_6,    KC_7,    KC_8,    KC_9,    KC_0,              KC_HASH, KC_EQL,  KC_MINS, KC_PLUS, __xxx__, KC_PENT, \
KC_LSFT, KC_COLN, KC_DLR,  KC_DOT,  KC_SLSH, KC_UNDS, _______,  KC_AMPR, KC_DLR,  _______, _______, _______, __xxx__,  \
_______, _______,                   _______, _______, _______,           _______,          _______,          __xxx__    \


),[CODE] = LAYOUT(
KC_ESC,  D_FORCQ, __xxx__, T_PLNXT, KC_VOLD, KC_VOLU,           KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   __xxx__, QK_BOOT, \
__xxx__, D_AUTHR, __xxx__, Z_DEL_W, __xxx__, __xxx__,           KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  __xxx__, \
__xxx__, D_MIMAP, __xxx__, D_SSHOT, __xxx__, __xxx__, __xxx__,  D_DBG_C, D_DBG_N, D_DBG_S, D_DBG_O, D_HELP,  KC_CAPS,  \
__xxx__, __xxx__,                   __xxx__, _______, __xxx__,           __xxx__,          __xxx__,          __xxx__    \

),
};

TAP_DANCE_INIT
bool caps_word_enabled = false;

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
    switch(keycode) {
      SHIFTED_CASE(ARROW, LGARW)
      CASE(STCMT) CASE(ENCMT)
      CASE(DEL_W)
      SHIFTED_CASE(XTODO, MTODO)
      CASE(DLR_0)
    }
  }
  return true;
}

void matrix_init_user(void) {
  // set all LEDs to output and low
  setPinOutput(B1); writePinLow(B1);
  setPinOutput(B2); writePinLow(B2);
  setPinOutput(B3); writePinLow(B3);
}

bool led_update_user(led_t led_state) {
  writePin(B2, led_state.caps_lock || caps_word_enabled);
  return false;
}

layer_state_t layer_state_set_user(layer_state_t state)
{
    writePin(B1, layer_state_cmp(state, SYMB) ||
                 layer_state_cmp(state, NAV) ||
                 layer_state_cmp(state, CODE) );
    writePin(B3, layer_state_cmp(state, NUM));
    return state;
}

void caps_word_set_user(bool active) {
    caps_word_enabled = active; // might be a builtin for this
    led_update_user(host_keyboard_led_state());
}
