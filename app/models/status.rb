class Status < ActiveHash: :Base
  self.date = [
    {id: 1, name: '--' },
    {id: 2, name: ''}
  ]

  include ActiveHash::Associations
  has_many :items

end
