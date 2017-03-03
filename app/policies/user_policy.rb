
class UserPolicy

  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def updateCategory?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def destroyCategory?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def createCategory?
    @user.kind=="administrator" and @user.status="ativo"
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
    @user.kind=="administrator" and @user.status="ativo"
  end

  def updateCity?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def destroyCity?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def createState?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def updateState?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def destroyState?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def createService?
    @user.kind=="professional" and @user.status="ativo"
  end

  def updateService?
    @user.kind=="professional" and @user.status="ativo"
  end

  def destroyService?
    @user.kind=="professional" and @user.status="ativo"
  end

  def createComment?
    @user.kind=="cliente" and @user.status="ativo"
  end

  def updateComment?
    @user.kind=="cliente" and @user.status="ativo"
  end

  def destroyComment?
    @user.kind=="cliente" and @user.status="ativo"
  end
  
  def linkHome?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def linkUsers?
    @user.kind=="administrator" or @user.kind=="professional" and @user.status="ativo"
  end

  def linkStates?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def linkCities?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def linkCategories?
    @user.kind=="administrator" and @user.status="ativo"
  end

  def linkServices?
    @user.kind=="administrator" or @user.kind=="professional" or @user.kind=="cliente" and @user.status="ativo"
  end

  def linkComments?
    false
    #@user.kind=="cliente" and @user.status="ativo"
  end

  def approve?
    @user.kind=="professional" and @user.status="ativo"
  end

end