class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  after_save :update_karma

  def self.by_karma
    self.order('total_karma DESC')
  end

  # def total_karma
  #   self.karma_points.sum(:value)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_karma
    self.total_karma = self.karma_points.sum(:value)
  end

  def self.page(page_number)
    self.limit(50).offset((page_number.to_i-1)*50)
  end

end


