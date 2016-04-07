class AddAvatarToParts < ActiveRecord::Migration
  def self.up
    add_attachment :parts, :avatar
  end

  def self.down
    remove_attachment :parts, :avatar
  end
end
