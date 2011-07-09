class BallotsController < ApplicationController
  # GET /ballots
  # GET /ballots.xml
  def index
    @survey = Survey.find(params[:survey_id])
    @ballots = Ballot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ballots }
    end
  end

  # GET /ballots/1
  # GET /ballots/1.xml
  def show
    @survey = Ballot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /ballots/new
  # GET /ballots/new.xml
  def new
    @survey = Ballot.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /ballots/1/edit
  def edit
    @survey = Ballot.find(params[:id])
  end

  # POST /ballots
  # POST /ballots.xml
  def create
    @survey = Ballot.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to(@survey, :notice => 'Ballot was successfully created.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ballots/1
  # PUT /ballots/1.xml
  def update
    @survey = Ballot.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(@survey, :notice => 'Ballot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1
  # DELETE /ballots/1.xml
  def destroy
    @survey = Ballot.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(ballots_url) }
      format.xml  { head :ok }
    end
  end
end
