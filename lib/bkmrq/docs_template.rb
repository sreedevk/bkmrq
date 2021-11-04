# frozen_string_literal: true

module Bkmrq
  # document output template
  class DocsTemplate
    FORMAT = {
      title: "#{ENV['USER']}'s Web Browser Bookmarks",
      subtitle: 'Bookmarks Exported Using Bkmrq',
      header_image: 'https://user-images.githubusercontent.com/36154121/137836028-8dfe3001-4626-47a0-880f-d3dc7b719e27.jpeg',
      description: <<-MD
      This file was auto generated using the [bkmrq](https://github.com/sreedevk/bkmrq) gem.
      MD
    }.freeze

    def self.title
      "# #{FORMAT[:title]}  \n"
    end

    def self.subtitle
      "## #{FORMAT[:subtitle]}  \n"
    end

    def self.header_image
      "![](#{FORMAT[:header_image]})  \n"
    end

    def self.description
      FORMAT[:description]
    end
  end
end
