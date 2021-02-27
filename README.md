# テーブル設計

## customersテーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| nickname        | string | null: false |

### Association
- has_many: requests
- has_many: room_users
- has_many: rooms
- has_many: messages
- has_many: comments
- has_many: ratings


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
| acceptable_area | integer | default: 1  |          |

### Association
- has_many: comments
- has_many: ratings
- has_many: messages
- has_many: room_users
- has_many: rooms
- has_many: orders
- has_many :agreements


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
| order       | references | forrign_key: true           |

### Association
- belongs_to :request
- belongs_to :engineer
- belongs_to :order
- has_one :complete


## completesテーブル
| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| agreement   | references | default: false, null: false |
| conclusion  | boolearn   | default: false, null: false |

### Association
- belongs_to :agreement


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
- has_one: order
- belongs_to: customer
- has_many: room_users
- has_many: rooms


## room_usersテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| request     | references | foreign_key: true |
| room        | references | foreign_key: true |
| customer    | references | foreign_key: true |
| engineer    | references | foreign_key: true |

### Association
- belongs_to: request
- belongs_to: room
- belongs_to: customer
- belongs_to: engineer


## roomsテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     |                   |

### Association
- has_one: room_user
- has_one: customer
- has_one: engineer
- has_many: messages


## messagesテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| content     | text       | null: false       |

### Association
- belongs_to: room
- belongs_to: customer
- belongs_to: engineer


## commentsテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| engineer_comment | text       |                   |
| customer         | references | foreign_key: true |
| engineer         | references | foreign_key: true |

### Association
- belongs_to: customer
- belongs_to: engineer


## ratingsテーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| rate             | integer    |                   |
| customer         | references | foreign_key: true |
| engineer         | references | foreign_key: true |

### Association
- belongs_to: customer
- belongs_to: engineer