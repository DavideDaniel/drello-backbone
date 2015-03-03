json.extract! @board, :id, :title, :created_at, :updated_at

json.viewers @board.viewers do |viewer|
  json.id viewer.id
  json.email viewer.email
end

json.lists @board.lists do |list|
  json.extract! list, :id, :title, :order, :created_at, :updated_at

  json.cards list.cards do |card|
    json.extract! card, :id, :title, :order, :created_at, :updated_at
  end
end
