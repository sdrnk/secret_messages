require 'securerandom'
require 'aes'

class Message < ActiveRecord::Base
  AES_KEY = "ef28dcacfe628933c49e5c0b55f67dbf"
  validates :body, presence: true
  before_create :set_random_uid, :encrypt_body

  def decrypted_body
    AES.decrypt(body, AES_KEY)
  end

  private
  def generate_unique_uid
    loop do
      random_uid = SecureRandom.hex(8)
      break random_uid unless Message.exists?(uid: random_uid)
    end
  end

  def set_random_uid
    self.uid = generate_unique_uid
  end

  def encrypt_body
    self.body = AES.encrypt(body, AES_KEY)
  end
end
