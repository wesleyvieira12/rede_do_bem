
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

  def updateUser?
    false
  end

  def destroyUser?
    false
  end

  def createCity?
    @user.kind=="administrator"
  end

  def updateCity?
    @user.kind=="administrator"
  end

  def destroyCity?
    @user.kind=="administrator"
  end

  def createState?
    @user.kind=="administrator"
  end

  def updateState?
    @user.kind=="administrator"
  end

  def destroyState?
    @user.kind=="administrator"
  end

  def createService?
    @user.kind=="professional"
  end

  def updateService?
    @user.kind=="professional"
  end

  def destroyService?
    @user.kind=="professional"
  end

  def createComment?
    @user.kind=="cliente"
  end

  def updateComment?
    @user.kind=="cliente"
  end

  def destroyComment?
    @user.kind=="cliente"
  end
  
  def linkHome?
    @user.kind=="administrator"
  end

  def linkUsers?
    @user.kind=="administrator"
  end

  def linkStates?
    @user.kind=="administrator"
  end

  def linkCities?
    @user.kind=="administrator"
  end

  def linkCategories?
    @user.kind=="administrator"
  end

  def linkServices?
    @user.kind=="administrator" or @user.kind=="professional" or @user.kind=="cliente" 
  end

  def linkComments?
    @user.kind=="cliente"
  end

end