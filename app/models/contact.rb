class Contact < ApplicationRecord
  
  # Associations
  has_many :notes, dependent: :destroy
  has_one :address, dependent: :destroy
  
  # Validations
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  # Class Method
  def self.by_first_name
    order(:first_name)
  end

  # Instance Method
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

# <% @contacts.each do |contact| %>
#   <h1> <%= contact.first_name %> <%= contact.last_name %> </h1> # normal way
#   <h1> <%= contact.full_name %> </h1> # instance method way
# <% end %>
