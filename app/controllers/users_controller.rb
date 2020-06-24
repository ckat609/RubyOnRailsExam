class UsersController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    aUser = User.new(register_params)
    puts "*"*50
    puts aUser.inspect
    puts "*"*50

    if aUser.save
      flash[:notices] = ["User #{aUser.fname} #{aUser.lname} (#{aUser.email}) created successfully!"]
      redirect_to sessions_new_path
      # session[:userid] = aUser.id
      # redirect_to users_show_path #uncomment to login right after successful registration
    else
      flash[:errors] = aUser.errors.full_messages
      redirect_to sessions_new_path
    end
  end

  def update
  end

  def destroy
  end

  private
    def register_params
      params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
    end
end
