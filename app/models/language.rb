class Language < ActiveHash::Base
  self.data = [
    {id: 1, name: '未設定'},
    {id: 2, name: '関数'},
    {id: 3, name: 'VBA'},
    {id: 4, name: '関数 & VBA'}
  ]

  include ActiveHash::Associations
  has_many :engineers
end