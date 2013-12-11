class PresentsController < ApplicationController

	def new
		@present = Present.new
	end
	
	def create
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:member_id])
		@present = @member.presents.create(pres_params)
		redirect_to [@family, @member]
	end
	
	def show
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:member_id])
		@present = @member.presents.find(params[:id])
	end
	
	def index
		@member = Family.find_by_name(params[:family_id]).members.find_by_usrname(params[:member_id])
		@present = @member.presents.all
	end
	
	def edit
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:member_id])
		@present = @member.presents.find(params[:id])
	end
	
	def update
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:member_id])
		@present = @member.presents.find(params[:id])
		if @present.update(pres_params)
			redirect_to (:back)
		else
			render 'edit'
		end
	end
	
	def destroy
		@family = Family.find_by_name(params[:family_id])
		@member = @family.members.find_by_usrname(params[:member_id])
		@present = @member.presents.find(params[:id])
		@present.destroy
		redirect_to [@family, @member]
	end
	
	private
	def pres_params
		params.require(:present).permit(:label, :santa, :bought)
	end

end
