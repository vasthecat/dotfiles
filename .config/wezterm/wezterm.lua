local wezterm = require 'wezterm';

return {
  colors = {
    background = '#101418',
    foreground = '#ededed',

    ansi = {
      '#2b1b1b',
      '#e42222',
      '#12df1d',
      '#e9b218',
      '#4879f6',
      '#dd0ffd',
      '#41c1e6',
      '#dcdcd0',
    },
    brights = {
      '#52545b',
      '#fb6a6a',
      '#74f435',
      '#ebcb71',
      '#8896ff',
      '#ec77ff',
      '#84e5f3',
      '#f7f7f1',
    },

    selection_bg = '#313131',
    selection_fg = '#fffefe',
  },
  font = wezterm.font "Input",
  hide_tab_bar_if_only_one_tab = true,
  font_size = 15,
  window_padding = {
    left = 7,
    right = 7,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 0.999,
  native_macos_fullscreen_mode = true,
  window_close_confirmation = 'NeverPrompt',
}
