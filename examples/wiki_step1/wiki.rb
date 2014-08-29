#!/usr/bin/env ruby

require 'sinatra'
require 'redcarpet'

get '/' do
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(File.read(File.join("../pages", file)))
end
