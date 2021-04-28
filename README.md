## users テーブル

|Column             |Type    |Options                 |
|-------------------|--------|------------------------|
|email              |string  |null:false, unique:true |
|encrypted_password |string  |null:false              |
|first_name         |string  |null:false              |
|last_name          |string  |null:false              |
|first_kana         |string  |null:false              |
|last_kana          |string  |null:false              |
|nickname           |string  |null:false              |
|birthday           |date    |null:false              |

### Association
has_many :items
has_many :order_logs

## items テーブル

|Column          |Type       |Options                      |
|----------------|-----------|-----------------------------|
|item_name       |string     |null:false                   |
|content         |text       |null:false                   |
|category_id     |integer    |null:false                   |
|condition_id    |integer    |null:false                   |
|shipping_fee_id |integer    |null:false                   |
|prefecture_id   |integer    |null:false                   |
|day_id          |integer    |null:false                   |
|price           |integer    |null:false                   |
|user            |references |null:false, foreign_key:true |

### Association
belongs_to : user
has_one :order_log

## order_logs テーブル

|Column       |Type       |Options                      |
|-------------|-----------|-----------------------------|
|user         |references |null:false, foreign_key:true |
|item         |references |null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :order

## orders テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|postal_number |string     |null:false                   |
|prefecture_id |integer    |null:false                   |
|city          |string     |null:false                   |
|address       |string     |null:false                   |
|building      |string     |                             |
|tel           |string     |null:false                   |
|order_log     |references |null:false, foreign_key:true |

### Association
belongs_to :order_log