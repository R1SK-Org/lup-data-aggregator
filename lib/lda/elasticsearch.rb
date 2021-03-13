require 'elasticsearch-ruby'

module LDA
  class Elasticsearch

    @client ||= Elasticsearch::Client.new url: ENV.fetch('LDA_ELASTICSEARCH_URL'), log: true

    class << self

      attr_reader :client

      def check
        client.cluster.health
      end

    end

  end
end
