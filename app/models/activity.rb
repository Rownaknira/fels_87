class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  TYPES = {
    start_lesson: 1,
    finish_lesson: 2,
    follow_user: 3,
    unfollow_user: 4
  }
  def self.create_activities(user, target, message_type)
    Activity.create user_id: user.id, target_id: target.id, action_type: message_type
  end
end
