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
- has_many: orders
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
| acceptable_area | integer | null: false |

### Association
- has_many: comments
- has_many: ratings
- has_many: messages
- has_many: room_users
- has_many: rooms


## ordersテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| request  | references | foreign_key: true |
| engineer | references | foreign_key: true |

### Association
- belongs_to: customer
- has_one: request


## requestsテーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| content     | text       | null: false       |
| hope_budget | string     | null: false       |
| term        | string     | null: false       |
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