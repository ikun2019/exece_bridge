class Study < ActiveHash::Base
  self.data = [
    {id: 0, name: 'エンジニア'},
    {id: 1, name: '学習者'}
  ]

  include ActiveHash::Associations
  has_many :engineers
end