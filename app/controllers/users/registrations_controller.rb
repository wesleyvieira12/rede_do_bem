class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def update?
    authorize @user, :admin
    true
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.status="inativo"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_registration_path, notice: 'Usuario criado, espere a ativação do seu cadastro.' }
        format.json { render :show, status: :created, location: new_user_registration_path }
      else
        format.html { render :new }
        format.json { render json: edit_user_registration_path, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    session[:id_cidade] = user_params[:city_id]
    user_params[:password_confirmation] = user_params[:password]
    super
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city_id, :category_id, :kind, :status, :email, :password, :password_confirmation, :perfil, :professional_id)
    end
end
