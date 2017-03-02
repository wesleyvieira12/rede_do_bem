
class CategoryPolicy

  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def update?
    user.admin? or not @category.published?
  end

  def admin
    user.admin?
  end
  
end