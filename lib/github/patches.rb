require 'rugged'

module Github
  class Patches
    attr_reader :repository, :pull_request

    def initialize(repository_path, pull_request)
      @repository   = Rugged::Repository.new(repository_path)
      @pull_request = pull_request
    end

    def patches
      @patches ||= repository.diff(pull_request.target_sha, pull_request.base_sha)
    end

    def files
      @files ||= patches.map    { |path| path.delta.new_file[:path] }.
                         select { |path| ruby_file?(path) }
    end

    private

    def ruby_file?(path)
      File.extname(path) == '.rb'
    end
  end
end
