/* user and group to drop privileges to */
static const char *user  = "sorath";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#2E2E2E",   /* during input */
	[FAILED] = "#2A0A12",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
