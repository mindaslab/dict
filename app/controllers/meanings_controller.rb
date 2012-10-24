class MeaningsController < ApplicationController
  # GET /meanings
  # GET /meanings.json
  
  layout 'home'
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :user_must_own_the_meaning, only: [:edit, :update, :destroy]
  
  def index
    @meanings = Meaning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meanings }
    end
  end

  # GET /meanings/1
  # GET /meanings/1.json
  def show
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meaning }
    end
  end

  # GET /meanings/new
  # GET /meanings/new.json
  def new
    @meaning = Meaning.new
	@word = Word.find(params[:word_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meaning }
    end
  end

  # GET /meanings/1/edit
  def edit
    @meaning = Meaning.find(params[:id])
  end

  # POST /meanings
  # POST /meanings.json
  def create
    @meaning = Meaning.new(params[:meaning])
    @meaning.user = current_user

    respond_to do |format|
      if @meaning.save
        format.html { redirect_to @meaning.word, notice: 'Meaning was successfully created.' }
        format.json { render json: @meaning, status: :created, location: @meaning }
      else
        format.html { render action: "new" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meanings/1
  # PUT /meanings/1.json
  def update
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      if @meaning.update_attributes(params[:meaning])
        format.html { redirect_to @meaning, notice: 'Meaning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meanings/1
  # DELETE /meanings/1.json
  def destroy
    @meaning = Meaning.find(params[:id])
    @meaning.destroy

    respond_to do |format|
      format.html { redirect_to meanings_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def user_must_own_the_meaning
	@meaning = Meaning.find(params[:id])
	redirect_to words_path, notice: "You must have created the meaning to edit it." unless @meaning.user == current_user
  end
end
