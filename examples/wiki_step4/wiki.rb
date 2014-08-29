#!/usr/bin/env ruby

require 'sinatra'
require 'redcarpet'

get '/' do
  redirect to('/guitar')
end

get '/:page' do
  file = File.join("../pages", "#{params[:page]}.md")
  redirect to("/#{params[:page]}/edit") unless File.exist?(file)

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  text = File.read(file)
  text += <<-BLOCK

---

[Edit](/#{params[:page]}/edit)

  BLOCK

  markdown.render(text)
end

get '/:page/edit' do
  page = params[:page]
  file = File.join("../pages", "#{page}.md")
  if File.exist?(file)
    content = File.read(file)
  else
    content = ""
  end
  <<-BLOCK
<form name="wikipage" action="/#{page}" method="POST">
    <textarea name="content" cols="80" rows="25">#{content}</textarea>
    <input type="submit" value="Save" />
</form>
  BLOCK
end

post '/:page' do
  File.open(File.join("../pages", "#{params[:page]}.md"), "w") do |f|
    f.write(params[:content])
  end
  redirect to("/#{params[:page]}")
end
