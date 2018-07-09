class Post < ApplicationRecord
  has_many   :images, dependent: :destroy
  belongs_to :user
  has_many   :tags, through: :post_tags
  has_many   :post_tags, dependent: :destroy

  accepts_nested_attributes_for :images, reject_if: :reject_images

  validates :title,
            :content,
             presence: true

  def reject_images(attributed)
    attributed['content'].blank?
  end

  def save_post(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 『.pluck』で配列を作る。作る内容は引数（カラム）に対するバリューを対象として。
      # 『.nil?』は存在自体（入れ物）がない場合true、空でも存在していればfalse。
      # @user = User.newに対して@user.nil?はfalse、newする前はtrueとなる。

    new_tags = savepost_tags - current_tags
    old_tags = current_tags - savepost_tags
    # 左側の配列内に存在しているもののみが除外される。無ければそのまま。

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end
    # 配列を一つずつ取り出して、テーブル内でカラムで検索をかけて、レコードを削除する。

    new_tags.each do |new_name|
      if new_name.present?
        post_tag = Tag.find_or_create_by(name: new_name)
        self.tags << post_tag
      end
    end
    # テーブル内でカラムを検索、または新規作成し、配列でテーブルに返す。
  end

end
