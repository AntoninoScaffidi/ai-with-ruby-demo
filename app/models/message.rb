class Message < ApplicationRecord
  acts_as_message chat: :conversation
end
