namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    items_before = Item.count
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    items_after = Item.count
    items_deleted = items_before - items_after
    puts "#{items_deleted} items deleted"    
  end
  

end
