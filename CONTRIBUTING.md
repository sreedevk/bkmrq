# Bkmrq Contribution Guidelines

## Application Overview

The bkmrq can be considered a pipeline with the following stages:

1. Extractor (bkmrq/lib/bkmrq/extractors/)
2. Parser (lib/bkmrq/parsers/)
3. Filter (lib/bkmrq/filter.rb)
4. Formatter (lib/bkmrq/formatters/)
5. Writer (lib/bkmrq/writer.rb)

### 1. Extractor

The Extractor is responsible for extracting the bookmarks data from the disk. Each supported browser has its own extractor class and each
extractor class is expected to implement support for all supported platforms.

Example: [BraveExtractor](lib/bkmrq/extractors/brave_extractor.rb)

### 2. Parser
The Parser is responsible for parsing the extracted bookmarks data into an intermediate representation using the [Bookmark](lib/bkmrq/bookmark.rb) class & [BookmarkFolder](lib/bkmrq/bookmark_folder.rb) class. 

### 3. Filter
The Filter traverses the intermediate representation and filters out bookmarks/folders that match the exclude patterns passed in using the `--exclude` option.

### 4. formatters
Formatters are responssible for converting the intermediate representation into the desired output format. Each supported format has its own formatter class.


## How you can help
1. Add support for more browsers. Feel free to open an issue & discuss the approach before starting work.
2. Test the gem on different platforms and browsers.
