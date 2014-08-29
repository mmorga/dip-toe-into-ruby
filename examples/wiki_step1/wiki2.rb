#!/usr/bin/env ruby

require 'sinatra'
require 'redcarpet'

get '/' do
  redirect to('/guitar')
end

get '/:page' do
  file = "#{params[:page]}.md"

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(File.read(File.join("../pages", file)))
end
