class Article < ApplicationRecord
    include Encryptable    
    
    validates :title, presence: true, length: { minimum: 5 }
    
    attr_encrypted :text
end
