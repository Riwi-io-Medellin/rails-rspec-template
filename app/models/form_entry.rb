class FormEntry < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3 }
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, length: { is: 10 }
    validates :birthdate, presence: true
end
