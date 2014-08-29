#!/usr/bin/env ruby

require 'sinatra'
require 'redcarpet'

get '/' do
  redirect to('/guitar')
end

get '/:page' do
  file = "#{params[:page]}.md"

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  text = File.read(File.join("../pages", file))
  text += <<-BLOCK

---

[Edit](/#{params[:page]}/edit)

  BLOCK

  puts text
  markdown.render(text)
end
