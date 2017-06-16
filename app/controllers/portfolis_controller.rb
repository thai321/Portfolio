class PortfolisController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update , :show, :destroy]
	layout 'portfolio'
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	def index
		# @portfolio_items = Portfoli.all
		@portfolio_items = Portfoli.by_position
	end

	def angular
		@angular_portfolio_items = Portfoli.anuglar
	end

	def new
		@portfolio_item = Portfoli.new
		3.times{ @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfoli.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html {redirect_to portfolis_path, notice: 'Your portfolio is now live.' }
			else
				format.html {render :new}
			end
		end
	end

	def edit
	end

	def update

		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolis_path, notice: "Your portfolio is successfully updated."}
			else												# /portfolis
				format.html {render :edit}
			end
		end
	end

	def show
	end

	def destroy
		# Destroy/delete the record
		@portfolio_item.destroy

		# Redirect
		respond_to do |format|
			format.html { redirect_to portfolis_url, notice: 'The portfolio was removed.'}
		end
	end

	
	private

	def portfolio_params
		params.require(:portfoli).permit(:title, 
																		 :subtitle, 
																		 :body, 
																		 technologies_attributes: [:name]
																		)
	end

	def set_portfolio_item # Peform the lookup
		@portfolio_item = Portfoli.find(params[:id])
	end
end
