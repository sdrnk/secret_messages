require 'sidekiq'

class MessageDestroyWorker
  include Sidekiq::Worker
  def perform(message_id)
    message = Message.find(message_id)
    message.destroy
  end
end
