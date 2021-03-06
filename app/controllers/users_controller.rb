class UsersController < ApplicationController

    before_action :set_user, only:[:edit,:update,:show]
    before_action :require_same_user, only:[:edit,:destroy,:update]
    before_action :require_admin, only:[:destroy]

    def new
        @user=User.new
    end  

    def index
        @users=User.paginate(page: params[:page], per_page: 2)
    end    
    
    def create
        @user=User.new(user_params)

        if @user.save
            session[:user_id]=@user.id
            flash[:success]= "welcome to MY BLOG #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'            
        end    

    end 
    
    def edit
              
    end  
    
    def update
        
        if @user.update(user_params)
            flash[:success]="user updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show
       
        @user_articles=@user.articles.paginate(page: params[:page], per_page: 2)
    end    

    def destroy
        @user=User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all articles created by user have been deleted"
        redirect_to users_path
    end 

    private 

        def set_user
            @user=User.find(params[:id])
        end
            
        def user_params
        params.require(:user).permit(:username, :email, :password)
        end   

        def require_same_user
            if current_user !=  @user and !current_user.admin?
                flash[:danger]="You Can Only Make Changes To Your Own Articles"
                redirect_to users_path
            end
        end    

        def require_admin
            if logged_in? and !current_user.admin?
                flash[:danger]="only admins are authorised to do this.. sorry :) "
                redirect_to users_path
            end
        end        

             

end    