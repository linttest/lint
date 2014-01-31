require 'base64'

module Github
  class File

    attr_reader :raw_data

    def initialize(raw_data)
      @raw_data = raw_data
    end

    def filename
      raw_data.filename
    end

    def sha
      raw_data.sha
    end

    def content
      decoded_content
    end

    private

    def encoded_content
      raw_data.rels[:contents].get.data.content
    end

    def decoded_content
      @decoded_content ||= Base64.decode64(encoded_content)
    end

  end
end
