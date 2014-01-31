require 'octokit'

module Lint
  class PullRequest

    attr_reader :repository_slug, :pull_request_id

    def initialize(repository_slug, pull_request_id)
      @repository_slug = repository_slug
      @pull_request_id = pull_request_id
    end

    def client
      @client ||= Octokit::Client.new
    end

    def base_sha
      @base_sha ||= pull_request.base.sha
    end

    def target_sha
      @target_sha ||= pull_request.head.sha
    end

    def pull_request
      @pull_request ||= client.pull_request(repository_slug, pull_request_id)
    end

  end
end
