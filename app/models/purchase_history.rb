class PurchaseHistory < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessor :checkRulePolicy
  validates :postcode,
    format: {with: /¥d+/, error: "半角数字のみ入力できます"},
    presence: true
  validates :telnumber,
    format: {with: /¥d+/, error: "半角数字のみ入力できます"},
    presence: true
  validates :last_name, :first_name, :email, :address, presence: true
  validates :checkRulePolicy, presence: true

end
