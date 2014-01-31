require 'octokit'

module Github
  class Connection

    attr_reader :connection

    def initialize(client_id = ENV['GITHUB_ID'], client_secret = ENV['GITHUB_SECRET'])
      @connection = Octokit::Client.new(:client_id => client_id, :client_secret => client_secret)
    end

    def get_repositories(username)
      get_user(username).rels[:repos].get.data
    end

    def get_user(username)
      connection.user(username)
    end

    def get_pull_request(repository_slug, pull_request_id)
      connection.pull_request(repository_slug, pull_request_id)
    end

    delegate :statuses, :to => :connection
  end
end
