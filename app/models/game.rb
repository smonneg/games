class Game < ApplicationRecord
  def self.search(platform, name)
    return Game.all if platform.blank? && name.blank?
    return Game.where(platform: platform) if name.blank?
    return Game.where("name LIKE ?", "%#{sanitize_sql_like(name)}%") if platform.blank?

    Game.
      where(platform: platform).
      where("name LIKE ?", "%#{sanitize_sql_like(name)}%")
  end
end
