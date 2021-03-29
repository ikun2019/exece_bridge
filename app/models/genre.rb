class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: "関数"},
    {id: 2, name: "VBA"},
    {id: 3, name: "関数 & VBA"},
    {id: 4, name: "その他"}
  ]

  include ActiveHash::Associations
  has_many :trainings
end