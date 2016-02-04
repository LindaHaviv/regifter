class Swap < ActiveRecord::Base
  belongs_to :item, foreign_key: :item_id, class_name: 'Gift'
  belongs_to :swapped_item, foreign_key: :swapped_item_id, class_name: 'Gift'
  belongs_to :new_owner, foreign_key: :new_owner_id, class_name: 'User'
  belongs_to :old_owner, foreign_key: :old_owner_id, class_name: 'User'

  def self.implement(requests)
    old_owner_id = Gift.find(requests[:unwanted_id]).user.id
    new_owner_id = Gift.find(requests[:wanted_id]).user.id
    @gift1 = Gift.find(requests[:wanted_id])
    @gift1.user = User.find(old_owner_id)
    @gift1.save
    @gift2 = Gift.find(requests[:unwanted_id])
    @gift2.user = User.find(new_owner_id)
    @gift2.save
    @swap1 = Swap.create(item_id: requests[:unwanted_id], swapped_item_id: requests[:wanted_id], new_owner_id: new_owner_id, old_owner_id: old_owner_id)
    @swap2 = Swap.create(item_id: requests[:wanted_id], swapped_item_id: requests[:unwanted_id], new_owner_id: old_owner_id, old_owner_id: new_owner_id)
    # binding.pry
    @user = User.find(old_owner_id)
    @gifts = @user.get_user_gifts
  end


end
