## users テーブル

|Column     |Type   |Options    |
|-----------|-------|-----------|
|email      |string |null:false |
|password   |string |null:false |
|first_name |string |null:false |
|last_name  |string |null:false |
|first_kana |string |null:false |
|last_kana  |string |null:false |
|nickname   |string |null:false |

### Association
has_many :items
has_many :purchase_logs

## items テーブル

|Column       |Type       |Options                      |
|-------------|-----------|-----------------------------|
|item_name    |string     |null:false                   |
|content      |text       |null:false                   |
|category     |integer    |null:false                   |
|condition    |integer    |null:false                   |
|shipping_fee |integer    |null:false                   |
|from         |integer    |null:false                   |
|day          |integer    |null:false                   |
|price        |integer    |null:false, precision:7      |
|user         |references |null:false, foreign_key:true |

### Association
belongs_to : user
has_one :purchase_log

## purchase_logs テーブル

|Column       |Type       |Options                      |
|-------------|-----------|-----------------------------|
|user         |references |null:false, foreign_key:true |
|item         |references |null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :purchase

## purchases テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|postal_number |text       |null:false                   |
|prefecture    |text       |null:false                   |
|city          |string     |null:false                   |
|address       |string     |null:false                   |
|building      |string     |                             |
|tel           |integer    |null:false, precision:11     |
|purchase_log  |references |null:false, foreign_key:true |

### Association
belongs_to :purchase_log