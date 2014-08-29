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

get '/:page/edit' do
  page = params[:page]
  content = File.read(File.join("../pages", "#{page}.md"))
  <<-BLOCK
<form name="wikipage" action="/#{page}" method="put">
    <textarea name="content" cols="80" rows="25">#{content}</textarea>
    <input type="submit" value="Save" />
</form>
  BLOCK
end
