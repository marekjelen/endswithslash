module Rack
  class EndsWithSlash

    def initialize app
      @app = app
    end

    def call env
      unless env['SCRIPT_NAME'] =~ /\/$/
        env['SCRIPT_NAME'] += '/'
      end
      unless env['PATH_INFO'] =~ /\/$/
        env['PATH_INFO'] += '/'
      end
      @app.call env
    end
  end
end
