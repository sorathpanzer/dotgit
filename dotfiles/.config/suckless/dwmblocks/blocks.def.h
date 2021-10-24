//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"", "st-torrent", 30, 7},
	{" ", "st-memory",	60,		8},
  {"", "st-temp", 150, 6},
  {"", "st-storage", 900, 3},
  {"", "st-battery", 60, 4},
  {"", "st-updates", 7200, 9},
  {"", "st-volume", 1, 1},
	{"", "st-clock",	10, 5},
  {"", "st-network", 30, 2},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 2;
