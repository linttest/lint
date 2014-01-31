module Analyzer
  class AlwaysPass

    def execute(content)
      Status.new(:success)
    end

  end
end
