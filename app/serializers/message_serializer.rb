class MessageSerializer < ActiveModel::Serializer

  attributes :id, :sender_id, :reciever_id, :body, :created_at

end
