require 'sprockets'
require "sprockets-sass"
require 'sass'

require 'sass/plugin/rack'
require 'compass'

project_root = File.expand_path(File.dirname(__FILE__))
assets = Sprockets::Environment.new(project_root) do |env|
  env.logger = Logger.new(STDOUT)
end

# asset paths
assets.append_path(File.join(project_root, 'components'))
assets.append_path(File.join(project_root, 'app', 'assets'))
assets.append_path(File.join(project_root, 'app', 'assets', 'javascripts'))
assets.append_path(File.join(project_root, 'app', 'assets', 'stylesheets'))

map "/assets" do
  run assets
end

# Sync output otherwise foreman won't print output, or log anything on heroku's logger
STDOUT.sync = true

use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}