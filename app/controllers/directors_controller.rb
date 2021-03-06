class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def new_form
      render("directors/new_form.html.erb")
  end

  def create_director
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]
    @director.save

    render("show")
  end

  def show
    @director = Director.find(params[:id])
    render("show.html.erb")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    redirect_to("/directors/#{@director.id}")

  end



  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
