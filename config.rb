# frozen_string_literal: true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end
activate :livereload
activate :relative_assets
activate :i18n, langs: %i[en sl], mount_at_root: false
set :relative_links, true
# activate :asset_hash

configure :build do
  activate :minify_css
  activate :minify_javascript
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/
# data.singers.singers.each do |singer|
#   proxy "/#{singer.name}.html", '/singer.html', locals: { singer: singer }, ignore: true
# end

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

helpers do
  def localized_paths_for(page)
    localized_paths = {}

    (langs - [I18n.locale]).each do |locale|
      locale_version_of_page = sitemap.resources.select do |resource|
        resource.path == page.path.gsub(I18n.locale.to_s, locale.to_s)
      end.first

      # If it exists, populate the localized_paths hash.
      localized_paths[locale] = locale_version_of_page.url if locale_version_of_page
    end

    localized_paths
  end

  def localized_text_for(text)
    case text.to_s
    when 'sl'
      '🇸🇮 Sloveniji'
    when 'it'
      '🇮🇹 Italiano'
    else
      '🇬🇧 English'
    end
  end
end
