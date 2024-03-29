# bkmrq
bkmrq `(pronounced bookmark)` is a command-line tool for organizing and transferring bookmarks across multiple browsers including Chrome, Firefox, Safari, and Opera. With just a few simple commands, export bookmarks in JSON, Markdown, CSV, and HTML formats. Ideal for automated scripts and command line users, it's fast and efficient. Specify format and location to easily transfer bookmarks, perfect for backups and sharing.

# Disclaimer
This project is still under development. If you would like to contribute, please checkout [CONTRIBUTING.md]().  
Bkmrq Currently only supports the following browsers  
- Brave (Default Profile Only)
- Chromium (Default Profile Only)
- Chrome (Default Profile Only)

The following formats are supported for exporting bookmarks
- markdown
- json
- html

# Installation
Running Bkmrq requires ruby installed (>= 3.0.0)

```bash
  gem install bkmrq
```

# Usage
```
        ___  __
       / _ )/ /__ __ _  _______ _
      / _  /  '_//  ' \/ __/ _ `/
     /____/_/\_\/_/_/_/_/  \_, /
                            /_/
    # Examples
    --------------------------------
    # Export Bookmarks from Brave Browser in Markdown format
    $ bkmrq export --to=brave_bookmarks.md --browser=brave --format=markdown

    # Export Bookmarks from Chromium Browser
    # in Markdown format & exclude bookmarks/folders with the word "php" and "java"
    $ bkmrq export --to=chromium_books.md --browser=chromium --format=markdown --exclude="php,java"
    --------------------------------

    # Supported Browsers(--browser=)
    - brave
    - chromium
    - chrome
    - firefox
    - opera
    - safari (mac only)

    # Supported Export Formats (--format=)
    - markdown
    - json
    - html
    - csv

    # OPTIONS:
    -o, --to=FILEPATH                 save the export file to <FILEPATH>
    -b, --browser=BROWSER             export bookmarks from <BROWSER>
    -f, --format=FILEFORMAT           export bookmarks to <FORMAT> File.
    -x, --exclude=XPATTERNS           exclude bookmarks or folders containing <KEYWORDS>
    -v, --version                    Print Version
    -h, --help                       Print help docs
```

# Examples
An example markdown file generated using this gemfile is available [here](https://github.com/sreedevk/bookmarks/blob/main/README.md)

Export bookmarks from `Brave Browser` in `markdown` format to `brave_bookmarks.md` file  
```bash
$ bkmrq -b brave -f markdown -o brave_bookmarks.md
```

Export bookmarks from `Brave Browser` in `json` format to `brave_bookmarks.json` file  
```bash
$ bkmrq -b brave -f json -o brave_bookmarks.json
```
