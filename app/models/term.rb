class Term < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '3日以内'},
    {id: 3, name: '1週間以内'},
    {id: 4, name: '2週間以内'},
    {id: 5, name: '3週間以内'},
    {id: 6, name: '1ヶ月以内'},
    {id: 7, name: '要相談'},
  ]
  include ActiveHash::Associations
  has_many :requests
end