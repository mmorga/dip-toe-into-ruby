# Sinatra

Sinatra is a minimalist DSL for building small web apps.

An example:

```ruby
require 'sinatra'

get '/' do
  'Hello world!'
end
```

# Ok so what's the minimum viable wiki?

A wiki has to have the following features:

1. Display a wiki page
2. Allow edits to a wiki page
3. Allow updates to a wiki page & Link between pages
4. Creating a new page

Let's get started.

## Display a page

```ruby
#!/usr/bin/env ruby

require 'sinatra'
require 'redcarpet'

get '/' do
  # TODO: this needs to be an option on the page
  file = "guitar.md"
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(File.read(File.join("pages", file)))
end
```

So that's ok for one "home" page, but what if we want to display another?

```
GET /more-guitar
```

So we're adding a route to the name of the page. And to keep the default working, we're making the default redirect to the default page name.

```ruby
get '/' do
  redirect to('/guitar')
end

get '/:page' do
  file = "#{params[:page]}.md"

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(File.read(File.join("../pages", file)))
end
```

## Allowing Edits to a Page

First off need to modify the page to add a link to edit it.

### Adding an Edit Link

Let's say the route for edit is:

/:page/edit

Change the get /:page method to do this:

```ruby
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
```

### Adding an Edit route

Talk about POST versus PUT here.

```ruby
get '/:page/edit' do
  page = params[:page]
  content = File.read(File.join("../pages", "#{page}.md"))
  <<-BLOCK
<form name="wikipage" action="/#{page}" method="POST">
    <textarea name="content" cols="80" rows="25">#{content}</textarea>
    <input type="submit" value="Save" />
</form>
  BLOCK
end
```

## Allowing Updates to a page

```ruby
post '/:page' do
  File.open(File.join("../pages", "#{params[:page]}.md"), "w") do |f|
    f.write(params[:content])
  end
  redirect to("/#{params[:page]}")
end
```

## Linking between pages

Inserting a link into pages is dirt simple.

Edit a page and add to the bottom.

```markdown
[More Guitars](more-guitar)
```

This is standard markdown syntax for a link. Since we chose a simple route scheme for our wiki, the default just works.

## Creating a new page

Go back to your show page: `get '/:page` and add this to the content below the edit.

