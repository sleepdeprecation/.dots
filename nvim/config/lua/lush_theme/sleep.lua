--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
--
-- enable with `:Lushify`

local lush = require('lush')
local hsl = lush.hsl

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  local hsl = lush.hsl

  local red       = hsl(357, 59, 53)  -- cd3f45
  local white     = hsl(197, 52, 95)
  local black     = hsl(200, 7, 9)
  local darkgray  = hsl(180, 2, 30)
  local lightgray = hsl(160, 4, 80)   -- d4d7d6
  local darkblue  = hsl(197, 52, 25)
  local blue      = hsl(197, 65, 60)  -- 55b5db
  local green     = hsl(82, 52, 56)   -- 9fca56
  local yellow    = hsl(47, 100, 79)
  local purple    = hsl(300, 90, 35)  -- 800080
  local pink      = hsl(335, 100, 50) -- ff026a


  return {
    -- GUI color config
    Normal    { fg = white },
    -- NormalNC       { }, -- normal text in non-current windows
    Visual         { bg = darkblue }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    Whitespace     { fg = darkgray.darken(20) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    NonText        { fg = purple.rotate(-30).desaturate(40) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    ErrorMsg       { fg = red.lighten(30) }, -- Error messages on the command line
    WarningMsg     { fg = yellow.lighten(30) }, -- Warning messages
    LineNr         { fg = darkgray },
    CursorLineNr   { LineNr, fg = LineNr.fg.lighten(30), gui = "bold" },


    StatusLine     { fg = hsl(160, 4, 180), bg = hsl(180, 2, 30), gui = "bold" },
    StatusLineNC   { StatusLine, fg = StatusLine.fg.darken(20), gui = ""},

    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.

    VertSplit      { fg = hsl(180, 2, 30) }, -- Column separating vertically split windows
    Winseparator   { fg = hsl(180, 2, 30) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.

    -- Pmenu          { }, -- Popup menu: Normal item.
    PmenuSel       { bg = hsl(197, 52, 55) }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.

    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.



    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Folded         { fg = darkblue.desaturate(10), bg = black }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.


    MatchParen     { fg = green, gui = "underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    Cursor       { fg = black,  bg = yellow },
    CursorLine   { bg = hsl(0, 0, 23) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { bg = hsl(200, 4, 16) },
    Search    { fg = black,   bg = green, gui = "bold" },
    IncSearch      { Search, gui = "" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- Substitute     { }, -- |:substitute| replacement text highlighting

    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|

    ColorColumn    { bg = hsl(200, 4, 16) }, -- Columns set with 'colorcolumn'

    SpellBad       { gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

    Directory      { fg = red }, -- Directory names (and other special names in listings)


    -- Common syntax groups
    Comment        { fg = darkgray.saturate(15).lighten(20) }, -- Any comment

    Constant       { fg = red.rotate(45) }, -- (*) Any constant
    String         { fg = blue }, --   A string constant: "this is a string"
    Character      { fg = red }, --   A character constant: 'c', '\n'
    Number         { fg = red.rotate(45) }, --   A number constant: 234, 0xff
    Boolean        { fg = red }, --   A boolean constant: TRUE, false
    Float          { fg = red.rotate(45) }, --   A floating point constant: 2.3e10

    Identifier     { fg = purple.lighten(40).desaturate(50) }, -- (*) Any variable name
    Function       { fg = blue }, --   Function name (also: methods for classes)

    Statement      { fg = green }, -- (*) Any statement
    Conditional    { fg = green, gui = "italic"}, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    Label          { fg = blue }, --   case, default, etc.
    Operator       { fg = green.darken(00).desaturate(40), gui = "italic"}, --   "sizeof", "+", "*", etc.
    Keyword        { fg = green }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = pink }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    Define         { fg = green, gui = "italic" }, --   Preprocessor #define
    Macro          { Define }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = blue }, -- (*) int, long, char, etc.
    StorageClass   { fg = yellow }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = darkblue.lighten(20) }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    Tag            { fg = blue }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    Todo           { fg = lightgray, bg = darkgray, gui = "bold"}, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Diffs
    DiffAdd        { fg = lightgray.lighten(60), bg = green.saturate(90).darken(60) },
    DiffChange     { fg = lightgray }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg = lightgray.lighten(60), bg = red.darken(50) }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { fg = lightgray, gui = "bold" }, -- Diff mode: Changed text within a changed line |diff.txt|

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { Normal }, -- Comment
    sym"@text.reference"    { Identifier }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    sym"@text.underline"    { Underlined }, -- Underlined
    sym"@text.todo"         { Todo }, -- Todo
    sym"@comment"           { Comment }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    --
    sym"@constant"          { Constant }, -- Constant
    sym"@constant.builtin"  { Constant }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    sym"@define"            { Define }, -- Define
    sym"@macro"             { Macro }, -- Macro

    sym"@string"            { String }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    sym"@character"         { Character }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    sym"@number"            { Number }, -- Number
    sym"@boolean"           { Boolean }, -- Boolean
    sym"@float"             { Float }, -- Float

    sym"@function"          { Function }, -- Function
    sym"@function.builtin"  { Function }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    --sym"@property"          { fg = Identifier.fg.lighten(25).desaturate(50) }, -- Identifier
    sym"@property"          { fg = pink.lighten(60).saturate(50), gui = "italic" },
    sym"@constructor"       { fg = blue }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym"@variable"          { Identifier }, -- Identifier
    sym"@variable.parameter" { Normal },
    sym"@variable.member" { fg = red.lighten(35).saturate(50) },
    sym"@type"              { Type }, -- Type
    sym"@type.builtin"              { Type }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
