class MembersController < ApplicationController
	
	before_filter :authenticate, except: :create

	def new
		@member = Member.new
	end
	
	def create
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.create(mem_params)
		
		if @member.save
			redirect_to [@family, @member]
		else
			render 'new'
		end
	end
	
	def show
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:id])
	end
	
	def index
		@family = Family.find_by_name(params[:family_id])
		@members = @family.members.all
	end
	
	def edit
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:id])
	end
	
	def update
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:id])
		
		if @member.update(mem_params)
			redirect_to (:back)
			else
			render 'edit'
		end
	end
	
	def destroy
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:id])
		@member.destroy
		
		redirect_to @family
	end
	
	private
	
	def authenticate
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:id])
		authenticate_or_request_with_http_basic do |username, password|
		username == @member.usrname && password == @member.password
		#username == "admin" && password == "1234"
		end
	end
	
	def mem_params
		params.require(:member).permit(:usrname, :password, presents_attributes: [:label, :bought, :santa, :_destroy])	
	end
	
end
