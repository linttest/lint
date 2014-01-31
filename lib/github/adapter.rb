module Github
  class Adapter

    attr_reader :connection

    def initialize(client_id = ENV['GITHUB_ID'], client_secret = ENV['GITHUB_SECRET'])
      @connection = Octokit::Client.new(:client_id => client_id, :client_secret => client_secret)
    end

    def publish_commit_status(commit, status)
      connection.create_status(commit.repository_slug, commit.id, status.status)
    end

    def get_commit(commit)
      connection.commit(commit.repository_slug, commit.id)
    end

    def get_commit_files(commit)
      get_commit(commit).files.map { |file| Github::File.new(file) }
    end

    def get_user_repositories(username)
      connection.repositories(username).map { |repo| ::Repository.new(repo.name) }
    end

  end
end
