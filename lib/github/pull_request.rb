module Github
  class PullRequest

    attr_reader :repository_slug, :pull_request_id, :connection

    def initialize(repository_slug, pull_request_id, connection = Connection.new)
      @repository_slug = repository_slug
      @pull_request_id = pull_request_id
      @connection      = connection
    end

    def base_sha
      @base_sha ||= pull_request.base.sha
    end

    def target_sha
      @target_sha ||= pull_request.head.sha
    end

    def pull_request
      @pull_request ||= connection.get_pull_request(repository_slug, pull_request_id)
    end

  end
end
