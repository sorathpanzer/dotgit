/* ------------- colorscheme ------------- */
static const char col_black[]       = "#000000"; /* border color unfocused windows */
static const char col_white[]       = "#FFFFFF";
static const char col_gray1[]       = "#292d3e"; /* #292d3e */
static const char col_gray3[]       = "#cccccc"; /* #96b5b4 */
static const char col_velvet[]      = "#df73ff"; /* border color focused windows and tags DT=#74438e */
static const char col_purple[]      = "#74438e"; /* border color focused windows and tags DT=#74438e */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_black, col_black },
	[SchemeSel]  = { col_velvet, col_black,  col_purple  },
};
