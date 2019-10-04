class EncryptionService
    base = ENV.fetch("SECRET_KEY_BASE")    
    len = ActiveSupport::MessageEncryptor.key_len
    salt = ENV.fetch("ENCRYPTION_SERVICE_SALT")    
    KEY = ActiveSupport::KeyGenerator.new(base).generate_key(salt, len).freeze
  
    private_constant :KEY
  
    delegate :encrypt_and_sign, :decrypt_and_verify, to: :encryptor
  
    def self.encrypt(value)
      new.encrypt_and_sign(value)
    end
  
    def self.decrypt(value)
      new.decrypt_and_verify(value)
    end
  
    private
  
    def encryptor
      ActiveSupport::MessageEncryptor.new(KEY)
    end
end