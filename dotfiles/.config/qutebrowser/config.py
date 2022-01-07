# Autogenerated config.py
import subprocess
import os
from qutebrowser.api import interceptor

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig(True)
#config.source('/home/sorath/.config/qutebrowser/themes/onedark.py')
config.source('/home/sorath/.config/qutebrowser/themes/distrotube.py')
# Aliases for commands.
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
c.auto_save.session = True
c.auto_save.interval = 4000
c.statusbar.position = 'top'
c.content.autoplay = False
# Setting dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.grayscale.all = True
c.colors.webpage.darkmode.grayscale.images = 0.5
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.preferred_color_scheme= 'dark'
c.colors.webpage.darkmode.contrast = 1

c.content.user_stylesheets = ['~/.config/qutebrowser/schemes/minimal.css']
c.colors.webpage.bg = '#111111'

c.completion.cmd_history_max_items = 100
#c.completion.timestamp_format = '%Y-%m-%d'
#c.completion.web_history.max_items = -1
c.content.cache.maximum_pages = 500
#c.history_gap_interval = 30


# Cookies to accept
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.cookies.accept', 'all', 'www.etoro.com')
config.set('content.cookies.accept', 'all', 'www.tradingview.com')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://app.element.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# Load images automatically in web pages.
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
c.content.javascript.enabled = False
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', True, 'https://www.etoro.com')
config.set('content.notifications.enabled', True, 'https://www.tradingview.com')

# Directory to save downloads to.
c.downloads.location.directory = '/home/sorath/Transferências'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'always'

# Search engines.
#c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 's': 'https://www.startpage.com/search?q={}', 'g': 'https://www.google.com/search?q={}', 'y': 'https://www.youtube.com/results?search_query={}'}

c.completion.height = '30%'
c.completion.quick = True
c.completion.shrink = True

c.editor.encoding = 'utf-8'
c.fonts.completion.category = 'bold 10pt default_family'
c.fonts.completion.entry = '10pt default_family'
c.fonts.debug_console = '10pt default_family'
c.fonts.downloads = '10pt default_family'
c.fonts.hints = 'bold 12pt default_family'
c.fonts.keyhint = '10pt default_family'
c.fonts.messages.error = '10pt default_family'
c.fonts.messages.info = '10pt default_family'
c.fonts.messages.warning = '10pt default_family'
c.fonts.default_family = ["Monofur for Powerline", "Monospace", "DejaVu Sans Mono", "Monaco", "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", "Courier", "Liberation Mono", "monospace", "Fixed", "Consolas", "Terminal"]
c.fonts.prompts = '10pt default_family'
c.fonts.statusbar = '10pt default_family'
c.fonts.tabs.selected = '10pt default_family'
c.fonts.tabs.unselected = '10pt default_family'
c.fonts.web.family.cursive = ''
c.fonts.web.family.fantasy = ''
c.fonts.web.family.fixed = ''
c.fonts.web.family.sans_serif = ''
c.fonts.web.family.serif = ''
c.fonts.web.family.standard = ''
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6

c.content.cookies.accept = 'no-unknown-3rdparty'
c.content.default_encoding = 'utf-8'
c.content.frame_flattening = False
c.content.headers.referer = 'same-domain'
c.content.hyperlink_auditing = False
c.content.javascript.can_access_clipboard = False
c.content.media.audio_capture = 'ask'
c.content.media.video_capture = 'ask'
c.content.media.audio_video_capture = 'ask'
c.content.pdfjs = True
c.content.webgl = True
c.scrolling.smooth = True
c.content.dns_prefetch = True
c.content.headers.do_not_track = True
c.qt.args = ['disable-logging', 'disable-reading-from-canvas']

c.tabs.show = "multiple"
c.statusbar.show = "never"
#c.url.start_pages = ['file:///home/sorath/.config/qutebrowser/startpage/index.html']

## Bindings for normal mode
config.bind('<F2>', 'scroll-page 0 0.9')
config.bind('<F1>', 'scroll-page 0 -0.9')
config.bind('<greater>', 'open')
config.bind('<less>', 'home')
config.bind("M", 'mode-enter jump_mark')
config.bind('m', 'mode-enter set_mark')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('.', 'repeat-command')
config.bind('/', 'set-cmd-text /')
config.bind('f', 'set-cmd-text /')
config.bind(':', 'set-cmd-text :')
#config.bind('i', 'hint inputs --first')
config.bind('v', 'hint links spawn mpv --loop {hint-url}')
config.bind('V', 'hint links spawn st -e youtube-dl {hint-url}')
config.bind('<Ctrl-Down>', 'hint links download')
config.bind('<Ctrl-y>', 'hint links yank')
config.bind('<Ctrl-x>', 'hint images delete')
config.bind('d', 'hint images current')
config.bind('D', 'hint images tab-bg')
config.bind('<Ctrl-d>', 'hint --rapid images tab-bg')
config.bind('<Alt-d>', 'hint images tab-fg')
config.bind('e', 'hint links current')
#config.bind('<less>', 'hint links tab-bg')
config.bind('E', 'hint links tab-bg')
config.bind('<Ctrl-e>', 'hint --rapid links tab-bg')
config.bind('<Alt-e>', 'hint links tab-fg')
config.bind('<Ctrl-Alt-p>', 'print')
config.bind('@', 'macro-run')
#config.bind(';O', 'hint links fill :open -t -r {hint-url}')
#config.bind(';R', 'hint --rapid links window')
#config.bind(';Y', 'hint links yank-primary')
#config.bind(';b', 'hint all tab-bg')
#config.bind(';r', 'hint all tab-fg')
#config.bind(';h', 'hint all hover')
#config.bind(';i', 'hint images')
#config.bind(';o', 'hint links fill :open {hint-url}')
#config.bind('f', 'hint --rapid links tab-bg')
config.bind('i', 'hint inputs')
# config.bind('<Ctrl-D>', 'scroll-page 0 -1')
# config.bind('S', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-S>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
config.bind('x', 'tab-next')
config.bind('z', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-T>', 'open -t')
# config.bind('D', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'mode-enter passthrough')
# config.bind('<Ctrl-W>', 'tab-close')
# config.bind('<Ctrl-p>', 'tab-pin')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
# config.bind('<F11>', 'fullscreen')
# config.bind('m', 'reload')
# config.bind('<Return>', 'selection-follow')
# config.bind('=', 'zoom')
# config.bind('?', 'set-cmd-text ?')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('F', 'hint all tab')
# config.bind('G', 'scroll-to-perc')
# config.bind('M', 'bookmark-add')
# config.bind('N', 'search-prev')
# config.bind('j', 'set-cmd-text -s :open -t ')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('l', 'tab-next')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('[[', 'navigate prev')
# config.bind(']]', 'navigate next')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
# config.bind('cd', 'download-clear')
# config.bind('q', 'tab-close')
# config.bind('f', 'hint')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gc', 'tab-clone')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gv', 'tab-move -')
# config.bind('gm', 'tab-move')
config.bind('<Ctrl-o>', 'set-cmd-text :open {url:pretty}')
config.bind('<Ctrl-Right>', 'tab-move +')
config.bind('<Ctrl-Left>', 'tab-move -')
# config.bind('gu', 'navigate up')
# config.bind('t', 'scroll left')
#config.bind('i', 'mode-enter insert')
# config.bind('s', 'scroll down')
# config.bind('d', 'scroll up')
# config.bind('r', 'scroll right')
# config.bind('M', 'quickmark-save')
# config.bind('n', 'search-next')
# config.bind('J', 'set-cmd-text -s :open ')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
# config.bind('c', 'mode-enter caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wi', 'inspector')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xb', 'config-cycle statusbar.hide')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('xt', 'config-cycle tabs.show always switching')
# config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
# config.bind('yD', 'yank domain -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'selection-drop', mode='caret')
# config.bind('<Escape>', 'mode-leave', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'selection-toggle', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('T', 'scroll left', mode='caret')
# config.bind('S', 'scroll down', mode='caret')
# config.bind('D', 'scroll up', mode='caret')
# config.bind('R', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'mode-enter normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('t', 'move-to-prev-char', mode='caret')
# config.bind('s', 'move-to-next-line', mode='caret')
# config.bind('d', 'move-to-prev-line', mode='caret')
# config.bind('r', 'move-to-next-char', mode='caret')
# config.bind('v', 'selection-toggle', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'command-history-next', mode='command')
# config.bind('<Escape>', 'mode-leave', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'command-history-prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'mode-leave', mode='hint')
# config.bind('<Return>', 'hint-follow', mode='hint')

## Bindings for insert mode
config.bind('<Alt-Space>', 'edit-text', mode='insert')
# config.bind('<Escape>', 'mode-leave', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Ctrl-V>', 'mode-leave', mode='passthrough')

# Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'mode-leave', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Ctrl-N>', 'prompt-accept no', mode='prompt')
# config.bind('<Ctrl-Y>', 'prompt-accept yes', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'mode-leave', mode='register')

# Fix random position on workspace change
config.bind('<tab>', 'nop', mode='normal')
#########################################################################################

# Bindings for normal mode
config.bind('st', 'session-load trader')
config.bind('sx', 'session-load xxx')
config.bind('sh', 'session-load startpage')
config.bind('sl', 'set-cmd-text :session-load')
config.bind('ss', 'set-cmd-text :session-save')
config.bind('sd', 'set-cmd-text :session-delete  ')
config.bind('q', 'tab-close')
config.bind('<Alt-z>', 'back')
config.bind('<Alt-x>', 'forward')
config.bind('Z', 'back -t')
config.bind('X', 'forward -t')
config.bind('gd', 'download')
config.bind('gf', 'view-source')
config.bind('wi', 'inspector')
config.bind('wp', 'open -w -- {clipboard}')
#config.bind('<Alt-b>', 'config-cycle tabs.show always never')
config.bind('<Alt-p>', 'spawn --userscript qute-keepass -p ~/Syncthing/Backup/Database_keepass_14721.kdbx')
config.bind('<Alt-r>', 'spawn --userscript readability')
#config.bind('<Alt-f>', 'spawn --userscript openfeeds')
config.bind('<Alt-q>', 'spawn --userscript qr')
config.bind('<alt-t>', 'spawn --userscript translate')
config.bind('<ctrl-t>', 'spawn --userscript translate --text')
#config.bind('<alt-s>', 'open duck.com')
config.bind('gt', 'spawn --userscript switch_tab')
config.bind('b', 'spawn --userscript bookmarks')
config.bind('<Alt-b>', 'spawn --userscript dlbookmarks')
config.bind('B', 'spawn --userscript addbookmark')
config.bind('aa', 'set-cmd-text -s :quickmark-add {title} {url} ')
#config.bind('o', 'spawn --userscript dmenu-open')
#config.bind('O', 'spawn --userscript dmenu-open -t')
#config.bind('o', 'spawn --userscript fopen')

# Whether host blocking is enabled.
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/mmotti/pihole-regex/master/regex.list', 'https://dbl.oisd.nl/', 'https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext', 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist", "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts", "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt", "https://fanboy.co.nz/fanboy-problematic-sites.txt", "https://easylist.to/easylist/easylist.txt", "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
    ]
