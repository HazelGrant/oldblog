set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/feed.xml', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :deploy do |configure|
  configure.deploy_method = :git
  configure.branch = 'master'
end


activate :blog do |blog|
  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "blog_layout"
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md.erb"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

activate :syntax, :line_numbers => true

