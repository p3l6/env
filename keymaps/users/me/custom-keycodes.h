#ifndef USERSPACE
#define USERSPACE

#define _______ KC_TRNS // a key transparent to the layer below
#define XXXXXXX KC_NO   // a key physically missing
#define __xxx__ KC_NO   // a key masked for this layer

//
// D: Defined shorthands
//

// Move between window tabs
#define D_TAB_L G(S(KC_LBRC))
#define D_TAB_R G(S(KC_RBRC))
// Move between system spaces
#define D_SPC_L C(KC_LEFT)
#define D_SPC_R C(KC_RGHT)
// System
#define D_EXPOS C(KC_UP)
#define D_HELP  G(S(KC_SLSH))
#define D_SSHOT G(S(KC_5))
#define D_FORCQ G(A(KC_ESC))
// Debugging actions
#define D_DBG_C KC_F16
#define D_DBG_N KC_F17
#define D_DBG_S KC_F18
#define D_DBG_O KC_F19
// Adjust brightness
#define D_BRT_D KC_SCRL
#define D_BRT_U KC_PAUS
// Move lines, cursor, etc (vscode, xcode)
#define D_LIN_U A(S(KC_UP))    // move current line up
#define D_LIN_D A(S(KC_DOWN))  // move current line down
#define D_LIN_N G(S(KC_D))     // duplicate current line
#define D_LIN_X G(KC_D)        // delete current line
#define D_CUR_U A(KC_UP)       // extend multi-cursor
#define D_CUR_D A(KC_DOWN)     // extend multi-cursor
#define D_CUR_N G(S(KC_E))     // add multi-cursor at next matching word
#define D_CUR_A G(A(S(KC_E)))  // add multi-cursors at all matching words
#define D_SUBWD C(KC_LALT)     // arrow key modifier to move by camelCase
#define D_SWAP  C(KC_T)        // exchange characters on either side of cursor
#define D_BACK  G(C(KC_LEFT))  // xcode back
#define D_FRWD  G(C(KC_RIGHT)) // xcode navigate
#define D_GOTO  G(C(KC_J))     // xcode jump to definition
#define D_SEL_W G(C(S(KC_E)))  // select current word
#define D_AUTHR G(C(S(KC_A)))  // xcode toggle authors
#define D_MIMAP G(C(S(KC_M)))  // xcode toggle minimap
// Alfred triggers
#define D_ALF_X G(S(KC_X))
#define D_ALF_C G(S(KC_C))
#define D_ALF_V G(S(KC_V))

//
// Z: String Macros
//

enum custom_keycodes {
    Z_ARROW = SAFE_RANGE,
    Z_LGARW,
    Z_SWFMT,
    Z_JSFMT,
    Z_RBFMT,
    Z_ALTTB,
    Z_MTODO,
    Z_XTODO,
    Z_DEL_W,
    Z_DLR_0,
};

#define DEF_ARROW SEND_STRING("->");
#define DEF_LGARW SEND_STRING("=>");
#define DEF_SWFMT SEND_STRING("\\()"SS_TAP(X_LEFT));
#define DEF_JSFMT SEND_STRING("${}"SS_TAP(X_LEFT));
#define DEF_RBFMT SEND_STRING("#{}"SS_TAP(X_LEFT));
#define DEF_MTODO SEND_STRING("- [ ] ");
#define DEF_XTODO SEND_STRING("// :TODO: ");
#define DEF_DEL_W SEND_STRING(SS_LALT(SS_TAP(X_LEFT)SS_TAP(X_DEL)));
#define DEF_DLR_0 SEND_STRING("$0");

#define CASE(macro) case Z_##macro: DEF_##macro return false; break;
#define SHIFTED_CASE(macro, shifted_macro) case Z_##macro: { const uint8_t mods = get_mods(); \
  if (mods & MOD_MASK_SHIFT) { del_mods(MOD_MASK_SHIFT);  DEF_##shifted_macro set_mods(mods); } \
  else { DEF_##macro } return false; break; }

//
// T: Tap dance keycodes
//

#define T_PLNXT TD(0) // one: play, two: next
#define TAP_DANCE_INIT tap_dance_action_t tap_dance_actions[] = { \
  [0] = ACTION_TAP_DANCE_DOUBLE(KC_MPLY, KC_MFFD), \
  };

#endif
