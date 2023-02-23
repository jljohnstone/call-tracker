module UsersHelper
  def user_initials(first, last)
    "#{first[0]}#{last[0]}".upcase
  end
end
