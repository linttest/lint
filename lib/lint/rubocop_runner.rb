require 'rubocop'
require 'tempfile'

module Lint
  class RubocopRunner
    attr_reader :config, :content

    def initialize(content)
      @config  = Rubocop::ConfigStore.new
      @content = content
    end

    def offences
      @offences ||= inspector.send(:inspect_file, full_path, config)
    end

    def inspector
      @inspector ||= Rubocop::FileInspector.new({})
    end

    def full_path
      @full_path ||= file.path
    end

    def file
      @file ||= Tempfile.new('code').tap do |file|
        file.write(content)
        file.close
      end
    end
  end
end
