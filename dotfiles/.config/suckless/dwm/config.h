/* See LICENSE file for copyright and license details. */

static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 8;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 8;       /* vert inner gap between windows */
static const unsigned int gappoh    = 7;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 7;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const Bool viewontag         = True;     /* Switch view on tag switch */
static const int horizpadbar        = 6;        /* horizontal padding for statusbar */
static const int vertpadbar         = 7;        /* vertical padding for statusbar */
static const char *fonts[]          = { "UbuntuMono Nerd Font:size=10" };
static const char dmenufont[]       = "UbuntuMono Nerd Font:size=10";
static const char col_gray1[]       = "#292d3e"; /* #292d3e */
static const char col_gray2[]       = "#000000"; /* border color unfocused windows */
static const char col_gray3[]       = "#cccccc"; /* #96b5b4 */
static const char col_gray4[]       = "#c0c5ce";
static const char col_cyan[]        = "#74438e"; /* border color focused windows and tags DT=#645377 */
static const char col_cyan2[]       = "#a5bdf7";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"alacritty", NULL };
const char *spcmd2[] = {"keepassxc", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"Alacritty",      spcmd1},
	{"keepassxc",   spcmd2},
};

/* tagging */
static const char *tags[] = { "", "", "", "" };
static const char *alttags[] = { "|}|", "| |", "| |", "| |" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     switchtotag    isfloating   monitor */
	{ "qutebrowser",    	NULL,       NULL,       1,            1,             0,           -1 },
/*{ "Chromium",         NULL,       NULL,       1,            1,             0,           -1 },*/
	{ "st-256color",      NULL,       NULL,       2,            1,             0,           -1 },
/*	{ "Alacritty",        NULL,       NULL,       0,            0,             1,           -1 },*/
	{ "mpv",     			    NULL,       NULL,       1 << 2,       1,             0,           -1 },
	{ "Signal",    		    NULL,       NULL,       1 << 2,       1,             0,           -1 },
	{ "Sxiv",     	 	    NULL,       NULL,       1 << 2,       1,             0,           -1 },
	{ "libreoffice",      NULL,       NULL,       1 << 3,       1,             0,           -1 },
	{ "libreoffice-calc", NULL,       NULL,       1 << 3,       1,             0,           -1 },
	{ NULL,		            "Alacritty",NULL,		    SPTAG(0),		  0,             1,			      -1 },
	{ NULL,		            "keepassxc",NULL,		    SPTAG(1),		  0,             1,			      -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]=",      tile },    /* first entry is default */
	{ "|C|",      centeredmaster },
	{ "|F|",      monocle },
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define CMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_cyan2, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *shutcmd[]  = { "clpoweroff", NULL };
static const char *rebcmd[]  = { "clreboot", NULL };

static Key keys[] = {
	/* modifier               key              function        argument */
	{ MODKEY|ShiftMask,   	  XK_Return,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                 XK_Return,      spawn,          {.v = termcmd } },
	{ MODKEY,                 XK_b,           togglebar,      {0} },
	{ MODKEY|ShiftMask,       XK_Right,       rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,       XK_Left,        rotatestack,    {.i = -1 } },
	{ MODKEY,                 XK_Right,       focusstack,     {.i = +1 } },
	{ MODKEY,                 XK_Left,        focusstack,     {.i = -1 } },
	{ MODKEY,                 XK_Down,        focusstack,     {.i = +1 } },
	{ MODKEY,                 XK_Up,          focusstack,     {.i = -1 } },
	{ MODKEY|ControlMask,  	  XK_minus,       setmfact,       {.f = -0.02} },
	{ MODKEY|ControlMask,     XK_plus,        setmfact,       {.f = +0.02} },
	{ MODKEY,       	  			XK_Tab,         focusstack,     {.i = +1 } },
	{ MODKEY,                 XK_backslash,   view,           {0} },
	{ MODKEY,	          			XK_q,           killclient,     {0} },
	{ MODKEY,       					XK_F9,          setlayout,      {.v = &layouts[0]} },
	{ MODKEY,       					XK_F10,         setlayout,      {.v = &layouts[1]} },
	{ MODKEY,       					XK_F11,         setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,       XK_space,       togglefloating, {0} },
	{ MODKEY,                 XK_0,           view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,       XK_0,           tag,            {.ui = ~0 } },
	{ MODKEY,                 XK_comma,       focusmon,       {.i = -1 } },
	{ MODKEY,                 XK_period,      focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,       XK_comma,       tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,       XK_period,      tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask, 	  	XK_r,      	   	quit,           {1} },
	{ MODKEY,                 XK_i,      	   	incnmaster,     {.i = +1 } },
  { MODKEY,           			XK_d,      	   	incnmaster,     {.i = -1 } },
	{ MODKEY,                 XK_z, 	   			zoom,           {0} },
	{ MODKEY,            			XK_less,  	    togglescratch,  {.ui = 0 } },
	{ MODKEY,            			XK_a,	          togglescratch,  {.ui = 1 } },

    /* Gaps keybinds control */
	{ MODKEY,     						XK_g,      	   togglegaps,     {0} },
	{ MODKEY|ShiftMask,     				XK_g,      	   defaultgaps,     {0} },

    /* Apps Launched with SUPER + ALT + KEY  */
	{ MODKEY,        	  XK_w,      	  spawn,          CMD ("xdotool search --class Chromium windowactivate || chromium") },
/*  { MODKEY|ShiftMask, XK_space,     spawn,          CMD ("passmenu --type") },*/
	{ MODKEY|ShiftMask, XK_t,      	  spawn,          CMD ("tnoty") },
	{ MODKEY,        	  XK_j,      	  spawn,          CMD ("st -e journalctl --follow") },
	{ MODKEY,        	  XK_s,      	  spawn,          CMD ("dmsearch") },
	{ MODKEY,        	  XK_x,      	  spawn,          CMD ("12ft") },
	{ MODKEY,        	  XK_v,      	  spawn,          CMD ("playvideo") },
	{ MODKEY,        	  XK_Delete,    spawn,          SHCMD ("xset dpms force off") },
	{ MODKEY|ShiftMask, XK_Delete, 	  spawn,          {.v = shutcmd } },
	{ MODKEY|ShiftMask, XK_BackSpace, spawn,          {.v = rebcmd } },
	{ MODKEY,       	  XK_BackSpace, spawn,          CMD ("physlock") },
	{ 0,                XK_Print,  	  spawn,          CMD ("screenshot") },
	{ MODKEY|ShiftMask, XK_plus,   	  spawn,          SHCMD ("light -A 15") },
  { MODKEY|ShiftMask, XK_minus,  	  spawn,          SHCMD ("light -U 15") },
  { MODKEY,           XK_plus,   	  spawn,          SHCMD ("pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo +10%") },
  { MODKEY,           XK_minus,  	  spawn,          SHCMD ("pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo -10%") },
  { MODKEY,           XK_m, 	   		spawn,          SHCMD ("amixer -q sset Master toggle ") },
	{ MODKEY,        	 	XK_1,      	  spawn,          CMD("xdotool search --class qutebrowser windowactivate || qutebrowser") },
	{ MODKEY,        	  XK_2,      	  spawn,          CMD("xdotool search --class st-256color windowactivate || st") },
	TAGKEYS(            XK_1,            0)
	TAGKEYS(            XK_2,            1)
	TAGKEYS(            XK_3,            2)
	TAGKEYS(            XK_4,            3)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        setlayout,       {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

