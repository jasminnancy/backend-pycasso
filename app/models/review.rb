class Review < ApplicationRecord
    belongs_to :reviewed, class_name: "User", foreign_key: "reviewed_id"
    belongs_to :reviewer, class_name: "User", foreign_key: "user_id"
end
