require 'elasticsearch/api'

module LDA
  class Elasticsearch

    @client ||= ::Elasticsearch::Client.new(url: ENV.fetch("LDA_ELASTICSEARCH_URL", ""), log: true)

    class << self
      attr_reader :client

      def index(index:, id:, body:)
        return unless body.kind_of? Hash
        client.index index: index, type: "_doc", id: id, body: body
      end

      def check
        client.cluster.health
      end
    end
  end
end
