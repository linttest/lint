module Github
  class CommitStatus
    STATES = %w{pending success failure error}.freeze

    attr_reader :repository, :commit, :state

    def initialize(repository, commit, state = nil)
      @repository = repository
      @commit     = commit
      @state      = state
    end

    def push
      validate_state
      connection.create_status(repository, commit, state)
    end

    def get
      connection.statuses(repository, commit)
    end

    def connection
      @connection ||= Github::Connection.new
    end

    private

    def validate_state
      raise ArgumentError.new("State #{state} is not supported") if not STATES.include?(state)
    end
  end
end
