User.create(name: "admin", email: "admin@gmail.com", password: "password", password_confirmation: "password", admin: true)
User.create(name: "user", email: "user@gmail.com", password: "password", password_confirmation: "password")
items = ["鶏肉","牛肉","豚肉","じゃがいも","人参","キャベツ","白菜","なす","玉ねぎ","塩","サラダ油"]
items.each do |item|
  Item.create!(name:item)
end
