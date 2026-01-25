;; ── elisp skeleton / template ─────────────────────────────────────────────
(define-skeleton my/elisp-comment-box
  "Insert boxed comment"
  ""
  ";; ┌───────────────────────────────────────────────────────────────┐\n"
  ";; │ " _ "\n"
  ";; └───────────────────────────────────────────────────────────────┘\n")

(define-skeleton my/elisp-comment-line
  "Insert boxed comment"
  ""
  ";; ── " _ "  ───────────────────────────────────────────────\n")


;; ── C skeleton / template ─────────────────────────────────────────────

(define-skeleton my/c-file-init-skeleton
  "Insert standard C file header + main function"  
  "#include <stdio.h>\n"
  "#include <stdlib.h>\n\n"
  "int main(int argc, char *argv[])\n"
  "{\n"
  "    " _ "\n"                    ; cursor will be here
  "    return 0;\n"
  "}\n")

(define-skeleton my/c-header-init-skeleton
  "Insert classic C/C++ header with include guard"
  "Header name (without .h): "
  "// " str ".h\n"
  "#ifndef " (setq v1 (upcase (concat "__" (replace-regexp-in-string "[^a-zA-Z0-9]" "_" str) "_H__"))) "\n"
  "#define " v1 "\n\n"
  _                                 ; cursor here
  "\n\n"
  "#endif\n")


