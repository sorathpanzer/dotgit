/* ------------- colorscheme ------------- */
static const char col_black[]       = "#000000"; /* border color unfocused windows */
static const char col_gray1[]       = "#292d3e"; /* #292d3e */
static const char col_gray3[]       = "#cccccc"; /* #96b5b4 */
static const char col_gray4[]       = "#c0c5ce";
static const char col_purple[]        = "#df73ff"; /* border color focused windows and tags DT=#645377 */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, col_black },
	[SchemeSel]  = { col_purple, col_gray1,  col_purple  },
};
