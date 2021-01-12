module ApplicationHelper

  def following?(other_user)
    current_user.following.include?(other_user)
  end
end
