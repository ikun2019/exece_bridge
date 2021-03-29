# テーブル設計

## customersテーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| nickname        | string  | null: false |
| post_code       | string  | null: false |
| prefecture_id   | integer | null: false |
| city            | string  | null: false |
| house_number    | string  | null: false |
| building_name   | string  |             |
| phone_number    | string  | null: false |

### Association
- has_many :requests
- has_many :room_users
- has_many :rooms
- has_many :messages
- has_many :comments
- has_many :ratings


## engineersテーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| nickname        | string  | null: false |
| acceptable_area | integer | default: 1  |
| profile         | text    |             |
| language_id     | integer | default: 1  |
| premium         | boolean | default: 0  |
| study           | boolean | default: 1  |

### Association
- has_many :comments
- has_many :ratings
- has_many :messages
- has_many :room_users
- has_many :rooms
- has_many :orders
- has_many :agreements
- has_many :completes
- has_many :questions
- has_many :works

## ordersテーブル
| Column   | Type       | Options                     |
| -------- | ---------- | --------------------------- |
| request  | references | foreign_key: true           |
| engineer | references | foreign_key: true           |

### Association
- belongs_to: request
- belongs_to :engineer
- has_one :agreement


## agreementsテーブル
| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| request     | references | foreign_key: true           |
| engineer    | references | foreign_key: true           |
| order       | references | foreign_key: true           |
| answer      | boolean    | default: false              |

### Association
- belongs_to :request
- belongs_to :engineer
- belongs_to :order


## completesテーブル
| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| request     | references | foreign_key: true           |
| conclusion  | boolean    | default: false, null: false |

### Association
- belongs_to :request
- belongs_to :engineer

## requestsテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| customer    | references | foreign_key: true |
| title       | string     | null: false       |
| content     | text       | null: false       |
| budget_id   | integer    |                   |
| term_id     | integer    | null: false       |
| approach_id | integer    | null: false       |
| other       | text       |                   |

### Association
- has_one :order
- belongs_to :customer
- has_many :room_users
- has_many :rooms
- has_one :complete


## room_usersテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| request     | references | foreign_key: true |
| room        | references | foreign_key: true |
| customer    | references | foreign_key: true |
| engineer    | references | foreign_key: true |

### Association
- belongs_to :request
- belongs_to :room
- belongs_to :customer
- belongs_to :engineer


## roomsテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     |                   |

### Association
- has_one :room_user
- has_one :customer
- has_one :engineer
- has_many :messages


## messagesテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| content     | text       | null: false       |

### Association
- belongs_to :room
- belongs_to :customer
- belongs_to :engineer


## ratingsテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| rate             | integer    | null: false       |
| customer         | references | foreign_key: true |
| engineer         | references | foreign_key: true |
| customer_comment | text       |                   |

### Association
- belongs_to :customer
- belongs_to :engineer


## questionsテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| engineer         | references | foreign_key: true |
| title            | string     | null: false       |
| content          | text       | null: false       |

### Association
- belongs_to :engineer
- has_many :answers


## answersテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| question         | references | foreign_key: true |
| engineer         | references | foreign_key: true |
| answer           | text       | null: false       |
| rate             | integer    |                   |

### Association
- belongs_to :question
- belongs_to :engineer


## trainingsテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| title            | string     | null: false       |
| detail           | text       | null: false       |

### Association
- has_many :works

## worksテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| training         | references | foreign_key: true |
| engineer         | references | foreign_key: true |
| complete         | boolean    | default: false    |

### Association
- belongs_to :training
- belongs_to :engineer