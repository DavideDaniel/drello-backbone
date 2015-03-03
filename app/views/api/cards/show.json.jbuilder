json.extract! @card, :id, :title, :order, :created_at, :updated_at
json.likes @card.likes do |like|
  json.extract! like, :id, :title, :card_id, :done, :created_at, :updated_at
end

