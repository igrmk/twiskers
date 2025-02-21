Twiskers
========

<p align="center">
    <img src="twiskers-light/twiskers-light.svg" width="180"/>
    &nbsp; &nbsp; &nbsp; &nbsp;
    <img src="twiskers-dark/twiskers-dark.svg" width="180"/>
</p>

An alternative application icon for [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator.
Works best if little flat icons and twiskers on kittens are a few of your favorite things.
[JetBrains Mono](https://www.jetbrains.com/lp/mono/) font was used for angle brackets.

Installation
------------

### Linux

1. Download one of the variants e.g. [`twiskers-light/twiskers-light-256x256.png`](https://github.com/igrmk/twiskers/raw/main/twiskers-light/twiskers-light-256x256.png) to your preferred icons path e.g. `~/.icons` or `~/.local/share/icons`.
2. Edit your `~/.local/share/applications/kitty.desktop` file and set the `Icon` parameter to the **full absolute** path to the `twiskers-256x256.png` icon e.g. `/home/igrmk/.icons/twiskers-256x256.png`.

### macOS

See the official FAQ: [https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon](https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon)

Development
-----------

You need mac to build icons. Install inkscape and exiftool. Then run `build.sh` script.

Other alternatives
------------------

* https://github.com/k0nserv/kitty-icon
* https://github.com/DinkDonk/kitty-icon
* https://github.com/hristost/kitty-alternative-icon
