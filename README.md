# Mireru2 - Flexible File Viewer Keyboard Friend

A file viewer with a focus on flexibility by Ruby/GTK2.

A friend of a keyboard.

## Requirements

* Ruby/GTK2, Ruby/GtkSourceView2 in
  [Ruby-GNOME2](http://ruby-gnome2.sourceforge.jp/)

## Installation

    $ gem install mireru2

## Usage

### Launch

    $ mireru2 [OPTION]... [FILE]...

If no argument, then search current directory.

### Options

-R, --recursive<br />
    recursive search as "**/*"

-f, --font NAME<br />
    set font such as "Monospace 16"

### Keybind

#### Common

n: next<br />
p: prev<br />
r: reload<br />
e: expand path<br />
q: quit<br />

#### Scroll

h: left<br />
j: down<br />
k: up<br />
l: right<br />

#### Scale

+: larger<br />
-: smaller<br />

#### Special

T: thumbnail

#### Image

f: fits window size<br />
o: original size<br />

#### Text

f: change font (at random)<br />

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
