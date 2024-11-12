#lang racket

(require pict)
(require colors)

; Width and height of the wallpaper
(define width 1080)
(define height 1920)

; Width of a single block. Should be a common factor of width and height
(define block-size 40)

; Number of blocks in each row and column
(define cols (/ width block-size))
(define rows (/ height block-size))

; Make a colored block
(define (make-block color)
  (filled-rectangle block-size block-size
                    #:draw-border? #f
                    #:color (hsv->color (hsv color 0.3 0.9))))

; Create a wallpaper using a gradient of colors
(define wallpaper (for/fold ([vert (blank 0 0)])
                            ([offset (in-range 0 1 (/ 1 rows))])
                    (vl-append vert (for/fold ([horiz (blank 0 0)])
                                              ([hue (in-range 0 1 (/ 1 cols))])
                                      (ht-append horiz (make-block (let ([h (+ hue offset)])
                                                                     (if (>= h 1) (- h 1) h))))))))

wallpaper

; Save the wallpaper to a file.
;(send (pict->bitmap wallpaper) save-file "wallpaper.png" 'png)
