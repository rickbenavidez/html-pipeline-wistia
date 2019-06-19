require "html/pipeline"
require "html/pipeline/wistia/version"
require "html/pipeline/wistia/wistia_filter.rb"

module HTML
  class Pipeline
    autoload :WistiaFilter, 'html/pipeline/wistia/wistia_filter'
  end
end
