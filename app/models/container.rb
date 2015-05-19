class Container < ActiveRecord::Base

  private

  # disable single-table inheritance
  def self.inheritance_column
    nil
  end
end
