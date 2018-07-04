class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :posts
  has_one  :profile, dependent: :destroy

  # 『belongs_to』にしてしまうと、『ActiveModel::MissingAttributeError』『can't write unknown attribute `profile_id`』のエラーが出る
  # 1対1でも、参照先にidのカラムを持つテーブルが『belong_to』で記述し、参照されるテーブル側は『has_one』で記述する。（今回の場合、profileテーブルがuser_idカラムを持つ）

  accepts_nested_attributes_for :profile

  mount_uploader :avatar, UserImageUploader

end
