import vim
import re


def math():
    stack = vim.eval("synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0))")
    return vim.eval("vimtex#syntax#in_mathzone()") == "1" or (
        len(stack) > 0
        and vim.eval("synIDattr(" + stack[0] + ", 'name')")
        in ["markdownMathJax", "pandocLaTeXRegion"]
    )


def comment():
    return vim.eval("vimtex#syntax#in_comment()") == "1"


def env(name):
    [x, y] = vim.eval("vimtex#env#is_inside('" + name + "')")
    return x != "0" and y != "0"


def aftermath(snip, length):
    line = snip.buffer[snip.line]
    start = snip.column - length + 1
    if re.match("[A-Za-z\\d\\)\\}\\]]", line[start - 1 : start]):
        return True
    return False
