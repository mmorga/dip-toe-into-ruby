#!/usr/bin/env ruby

require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
File.open("markdown_example1.html", "w") do |f|
  f.write(markdown.render(File.read("markdown_example1.md")))
end
