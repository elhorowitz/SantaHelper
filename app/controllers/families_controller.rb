class FamiliesController < ApplicationController
	def new
		@family = Family.new
	end
	
	def create
		@family = Family.new(fam_params)
		
		if @family.save
			redirect_to @family
		else
			render 'new'
		end
	end
	
	def show
		@family = Family.find_by_name(params[:id])
	end
	
	def index
		@families = Family.all
	end
	
	def edit
		@family = Family.find_by_name(params[:id])
	end
	
	def update
		@family = Family.find_by_name(params[:id])
		
		if @family.update(fam_params)
			redirect_to [@family, @member]
			else
			render 'edit'
		end
	end
	
	def destroy
		@family = Family.find_by_name(params[:id])
		@family.destroy
		
		redirect_to families_path
	end
	
	private
	def fam_params
		params.require(:family).permit(:name, members_attributes: [:usrname, :email, :_destroy])
	end
end
