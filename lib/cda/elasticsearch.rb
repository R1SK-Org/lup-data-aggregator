require 'elasticsearch-ruby'

module CDA
  class Elasticsearch

    @client ||= Elasticsearch::Client.new url: ENV.fetch('CDA_ELASTICSEARCH_URL'), log: true

    class << self

      attr_reader :client

      def check
        client.cluster.health
      end

    end

  end
end
