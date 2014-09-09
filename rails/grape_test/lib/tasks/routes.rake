desc "Routes with API routes"
task all_routes: :environment do
  Rails.application.require_environment!

  require 'action_dispatch/routing/inspector'
  all_routes = Rails.application.routes.routes
  inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
  output = inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
  puts output

  first_line = output.lines.first
  verb_index = first_line.index("Verb")
  pattern_index = first_line.index("URI Pattern")

  Books::API.routes.each do |api|
    method = api.route_method
    .ljust(pattern_index-verb_index-1)
    .rjust(pattern_index-1)

    path = api.route_path
    puts "#{method} #{path}"
  end
end
