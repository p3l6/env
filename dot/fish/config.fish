# Note: Fish loads this file after everything in the conf.d/ directory,
#   so no shared variables can be defined here.

set --global fish_key_bindings fish_default_key_bindings

# Theme

set --global fish_color_normal normal
set --global fish_color_history_current --bold
set --global fish_color_search_match brwhite --bold --background=brblue
set --global fish_color_valid_path --underline=single

set --global fish_color_autosuggestion brblack
set --global fish_color_comment brblack

set --global fish_color_quote red
set --global fish_color_error brred

set --global fish_color_command cyan

set --global fish_color_escape yellow
set --global fish_color_option yellow

set --global fish_color_param blue

set --global fish_color_keyword magenta
set --global fish_color_end magenta
set --global fish_color_operator magenta
set --global fish_color_redirection magenta
