module Github
  class Repository

    attr_reader :connection

    def initialize(connection = Connection.new)
      @connection = connection
    end

    def for_user(username)
      connection.get_repositories(username).map { |repo| ::Repository.new(repo.name) }
    end

  end
end
