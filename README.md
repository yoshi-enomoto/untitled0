# untitled0

投稿ができるアプリケーション

## 機能
- ユーザー登録・ログイン機能
- 自己紹介機能
- 投稿機能
- タグ付け機能
- いいね機能
- コメント機能

## 特記事項
今後以下の機能も追加するかも
- 検索機能
- メッセージ機能
- グループトーク機能
- お気に入り機能
- 足あと機能
- 友達・マッチング機能
- コミュニティ機能


# Structure of DataBase

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|avatar|text|-gem-|
|email, password|string|-gem-|

### association
```
has_many   :posts
has_many   :likes
has_many   :comments
belongs_to :profile
```


## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_kye: true|
|nickname|string|null: false|
|age|||
|occupation|||
|detail|||
|etc|||

### association
```
belongs_to :user
```


## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|user|references|null: false, foreign_key: true|
|like_count|integer|default: 0|

### association
```
has_many   :images
has_many   :likes
has_many   :comments
belongs_to :user
has_many   :tags, through: :post_tags
has_many   :post_tags, dependent: :destroy
```


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|-gem-|
|post|references|null: false, foreign_key: true|

### association
```
belongs_to :post, optional: true
```


## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### association
```
belongs_to :user
belongs_to :post
```


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false |
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### association
```
belongs_to :user
belongs_to :post
```


## Tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### association
```
has_many :posts, through: :post_tags
has_many :post_tags, dependent: :destroy
```


## PostTagsテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|

### association
```
belongs_to :post
belongs_to :tag
```
