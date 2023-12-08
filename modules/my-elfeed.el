(use-package elfeed)

(setq elfeed-feeds
      '(
        ("https://world.hey.com/dhh/feed.atom")
        ("https://manateelazycat.github.io/feed.xml")
        ("http://xahlee.info/kbd/keyboard_blog.xml" keyboard)
        ("http://xahlee.info/emacs/emacs/blog.xml" code emacs)
        ("http://xahlee.info/comp/blog.xml" code)
        ("http://xahlee.info/math/blog.html" math)
        ("http://xahlee.info/js/blog.xml" code web)
        ;;("https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ" code)
        ))

(setq-default elfeed-search-filter "@1-months-ago ")

;; Mark all YouTube entries
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "youtube\\.com"
                              :add '(video youtube)))

(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "xahlee\\.info"
                              :add '(xahlee)))


(defface unreed-elfeed-background
  '((t :background "#e0e0e0"))
  "Marks an Unreed Elfeed background.")

(push '(unread unreed-elfeed-background)
      elfeed-search-face-alist)

(provide 'my-elfeed)
