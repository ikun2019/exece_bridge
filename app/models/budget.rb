class Budget < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '〜5,000円'},
    {id: 3, name: '5,000円〜1万円'},
    {id: 4, name: '1万円〜2万円'},
    {id: 5, name: '2万円〜3万円'},
    {id: 6, name: '3万円〜4万円'},
    {id: 7, name: '4万円〜5万円'},
    {id: 8, name: '5万円〜10万円'},
    {id: 9, name: '10万円'},
    {id: 10, name: '要相談'}
  ]
  include ActiveHash::Associations
  has_many :requests
end