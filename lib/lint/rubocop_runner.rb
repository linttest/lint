require 'rubocop'

module Lint
  class RubocopRunner
    attr_reader :config, :patch, :repository

    def initialize(repository, patch)
      @config     = Rubocop::ConfigStore.new
      @patch      = patch
      @repository = repository
    end

    def offences
      @offences ||= inspector.send(:inspect_file, full_path, config)
    end

    def inspector
      @inspector ||= Rubocop::FileInspector.new({})
    end

    def full_path
      path = Pathname.new(repository.path).parent
      path.join(patch.delta.new_file[:path])
    end
  end
end
