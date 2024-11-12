## Creating a colorful HD wallpaper using Racket

I needed a new wallpaper for my phone, and nothing on the usual wallpaper sites was striking my fancy. I wanted something colorful, so I decided to make one in Racket.

I chose to create a wallpaper with a rainbow gradient that extended horizontally and vertically. My strategy was to combine blocks of different colors and use a loop to cycle through the colors. The [Racket pict library](https://docs.racket-lang.org/pict/index.html) provides useful functions for creating and combining shapes, so I decided to use that.

Cycling through colors to create a rainbow gradient wasn't so simple. Racket's [color% class](https://docs.racket-lang.org/draw/color_.html) is based on RGB values, but it is not straightforward to get a nice looking rainbow by looping through RGB values. Instead, I used [Spencer Florence's colors library](https://docs.racket-lang.org/colors/index.html), which lets us specify colors using Hue, Saturation, and Value. By specifying a Saturation and Value, I could easily loop through Hue to get a pleasant rainbow effect.

I created a function to produce a colored block and used Racket's [for/fold](https://docs.racket-lang.org/reference/for.html#%28form._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._for%2Ffold%29%29) form to loop through the colors and combine the blocks in a single nested loop. The rest of the code defines the size of the wallpaper and the blocks. A final line at the end saves the wallpaper to a file. This line is commented out to prevent accidental overwrites. If you want to save the wallpaper, just uncomment the line, and the wallpaper will be saved as a PNG file in the current directory.
