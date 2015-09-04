class User < ActiveRecord::Base
  has_many :workouts
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.search_by_name(name)
    names = name.split(' ')
    
    if names.count == 1
      where('first_name LIKE ? or last_name LIKE ?', "%#{names[0]}%",
             "%#{names[0]}%").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ?
             or last_name LIKE ?', "%#{names[0]}%", "%#{names[1]}%",
                                   "%#{names[0]}%", "%#{names[1]}%")
      .order(:first_name)
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end
  
end
