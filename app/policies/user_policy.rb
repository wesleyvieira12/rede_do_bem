
class UserPolicy

  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def updateCategory?
    @user.kind=="administrator"
  end

  def destroyCategory?
    @user.kind=="administrator"
  end

  def createCategory?
    @user.kind=="administrator"
  end

  def createUser?
    false
  end
  
end