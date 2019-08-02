class UsersController < ApplicationController

    def new
        @user=User.new
    end  
    
    def create
        @user=User.new

        if @user.save
            flash[:success]= "welcome to MY BLOG #{@user.username}"
            redirect_to 'articles_path'
        else
            render 'new'            
        end    

    end    

end    