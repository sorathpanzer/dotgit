# Autogenerated config.py
import subprocess
import os
from qutebrowser.api import interceptor

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig(True)

# Aliases for commands.
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Setting dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.grayscale.all = True
c.colors.webpage.darkmode.grayscale.images = 0.5
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'smart'
# c.colors.webpage.darkmode.contrast = 1
#c.colors.webpage.darkmode.threshold.text = 20

#c.content.user_stylesheets = ['~/.config/qutebrowser/schemes/nord.css']

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

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
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

config.set('content.javascript.enabled', True, 'file:///home/sorath/.config/qutebrowser/startpage/index.html')
config.set('content.javascript.enabled', True, 'www.etoro.com')
config.set('content.javascript.enabled', True, 'www.tradingview.com')
config.set('content.javascript.enabled', True, 'www.youtube.com')

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
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 's': 'https://www.startpage.com/search?q={}', 'g': 'https://www.google.com/search?q={}', 'y': 'https://www.youtube.com/results?search_query={}'}

c.completion.height = '30%'
c.completion.quick = True
c.completion.shrink = True
c.colors.completion.fg = ['#9cc4ff', 'white', 'white']
c.colors.completion.odd.bg = '#1c1f24'
c.colors.completion.even.bg = '#232429'
c.colors.completion.category.fg = '#e1acff'
c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)'
c.colors.completion.category.border.top = '#3f4147'
c.colors.completion.category.border.bottom = '#3f4147'
c.colors.completion.item.selected.fg = '#282c34'
c.colors.completion.item.selected.bg = '#ecbe7b'
c.colors.completion.item.selected.match.fg = '#c678dd'
c.colors.completion.match.fg = '#c678dd'
c.colors.completion.scrollbar.fg = 'white'
c.colors.downloads.bar.bg = '#282c34'
c.colors.downloads.error.bg = '#ff6c6b'
c.colors.hints.fg = '#282c34'
c.colors.hints.match.fg = '#98be65'
c.colors.messages.info.bg = '#282c34'
c.colors.statusbar.normal.bg = '#282c34'
c.colors.statusbar.insert.fg = 'white'
c.colors.statusbar.insert.bg = '#497920'
c.colors.statusbar.passthrough.bg = '#34426f'
c.colors.statusbar.command.bg = '#282c34'
c.colors.statusbar.url.warn.fg = 'yellow'
c.colors.tabs.bar.bg = '#1c1f34'
c.colors.tabs.odd.bg = '#282c34'
c.colors.tabs.even.bg = '#282c34'
c.colors.tabs.selected.odd.bg = '#282c34'
c.colors.tabs.selected.even.bg = '#282c34'
c.colors.tabs.pinned.odd.bg = 'seagreen'
c.colors.tabs.pinned.even.bg = 'darkseagreen'
c.colors.tabs.pinned.selected.odd.bg = '#282c34'
c.colors.tabs.pinned.selected.even.bg = '#282c34'

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

c.tabs.show = "never"
c.statusbar.show = "never"
c.url.start_pages = ['file:///home/sorath/.config/qutebrowser/startpage/index.html']

# Bindings for normal mode
config.bind('V', 'hint links spawn mpv {hint-url}')
config.bind('D', 'hint links spawn st -e youtube-dl {hint-url}')
#config.bind('t', 'set-cmd-text -s :open -t')
config.bind('<Alt-b>', 'config-cycle tabs.show always never')
config.bind('st', 'session-load trader')
config.bind('sl', 'set-cmd-text :session-load')
config.bind('ss', 'set-cmd-text :session-save')
config.bind('sd', 'set-cmd-text :session-delete  ')
config.bind('<Right>', 'tab-next', mode='normal')
config.bind('<Left>', 'tab-prev', mode='normal')
config.bind('<Alt-p>', 'spawn --userscript qute-keepass -p ~/Syncthing/Backup/Database_keepass_14721.kdbx')
config.bind('<Alt-r>', 'spawn --userscript readability')
config.bind('<Alt-f>', 'spawn --userscript openfeeds')
config.bind('<Alt-q>', 'spawn --userscript qr')
config.bind('<alt-t>', 'spawn --userscript translate')
config.bind('<ctrl-t>', 'spawn --userscript translate --text')
config.bind('<alt-s>', 'open duck.com')
config.bind('gt', 'spawn --userscript switch_tab')
#config.bind('o', 'set-cmd-text -s :quickmark-load -t')
config.bind('o', 'spawn --userscript dmenu-open')

# Whether host blocking is enabled.
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.hosts.lists = ['http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext', 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
