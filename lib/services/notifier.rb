require 'json'

class Services::Notifier
  def initialize(routing_key:, type:, message:)
    @routing_key = routing_key
    @type = type
    @message = message
  end

  def call
    publish
  end

  private

  attr_accessor :routing_key, :type, :message

  def publish
    exchange.publish({ type: type, msg: message }.to_json, routing_key: routing_key)
    connection.close
  end

  def connection
    @connection ||= begin
                      connection = Bunny.new(host: Rails.configuration.rabbitmq_host)
                      connection.start
                    end
  end

  def exchange
    @exchange ||= channel.direct('projects')
  end

  def channel
    @channel ||= connection.create_channel
  end
end