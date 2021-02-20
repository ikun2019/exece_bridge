class Approach < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '訪問対応'},
    {id: 3, name: 'リモート対応'},
    {id: 4, name: '要相談'}
  ]

  include ActiveHash::Associations
  has_many :requests
end