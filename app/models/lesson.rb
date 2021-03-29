class Lesson < ActiveHash::Base
  self.data = [
    {id: 1, name: "Lesson1"},
    {id: 2, name: "Lesson2"},
    {id: 3, name: "Lesson3"},
    {id: 4, name: "Lesson4"},
    {id: 5, name: "Lesson5"},
    {id: 6, name: "Lesson6"},
    {id: 7, name: "Lesson7"},
    {id: 8, name: "Lesson8"},
    {id: 9, name: "Lesson9"},
    {id: 10, name: "Lesson10"},
  ]

  include ActiveHash::Associations
  has_many :trainings
end