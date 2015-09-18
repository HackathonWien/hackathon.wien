set :s3_url, "https://s3-eu-west-1.amazonaws.com/foodhack"
set :analytics_code, "UA-61872324-1"

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, apply_js_live: false, apply_css_live: false
end

# blog
activate :blog do |blog|
  blog.sources   = "posts/{year}-{month}-{day}-{title}.html"
  blog.permalink = "posts/{year}-{month}-{day}-{title}.html"
  blog.layout    = "layouts/article"
end


# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  def slideshow category
    content_tag(:div, class: "images") {
      data.images.send(category).map { |name|
        orig_url = [settings.s3_url, category, "original", name + ".JPG"].join("/")
        thumb_url = [settings.s3_url, category, "thumbs", name + ".jpeg"].join("/")
        content_tag(:a, href: orig_url, "data-lightbox" => category) {
          image_tag thumb_url
        }
      }.join("\n")
    }
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# To deploy to a remote branch via git (e.g. gh-pages on github):
activate :deploy do |deploy|
  deploy.method = :git
  # remote is optional (default is "origin")
  # run `git remote -v` to see a list of possible remotes
  #deploy.remote = "some-other-remote-name"

  # branch is optional (default is "gh-pages")
  # run `git branch -a` to see a list of possible branches
  #deploy.branch = "some-other-branch-name"

  # strategy is optional (default is :force_push)
  #deploy.strategy = :submodule
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
