class NeglectedTermsController < ApplicationController
  before_action :set_neglected_term, only: [:show, :edit, :update, :destroy]

  # GET /neglected_terms
  # GET /neglected_terms.json
  def index
    @neglected_terms = NeglectedTerm.all
  end

  # GET /neglected_terms/1
  # GET /neglected_terms/1.json
  def show
  end

  # GET /neglected_terms/new
  def new
    @neglected_term = NeglectedTerm.new
  end

  # GET /neglected_terms/1/edit
  def edit
  end

  # POST /neglected_terms
  # POST /neglected_terms.json
  def create
    @neglected_term = NeglectedTerm.new(neglected_term_params)

    respond_to do |format|
      if @neglected_term.save
        format.html { redirect_to @neglected_term, notice: 'Neglected term was successfully created.' }
        format.json { render :show, status: :created, location: @neglected_term }
      else
        format.html { render :new }
        format.json { render json: @neglected_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neglected_terms/1
  # PATCH/PUT /neglected_terms/1.json
  def update
    respond_to do |format|
      if @neglected_term.update(neglected_term_params)
        format.html { redirect_to @neglected_term, notice: 'Neglected term was successfully updated.' }
        format.json { render :show, status: :ok, location: @neglected_term }
      else
        format.html { render :edit }
        format.json { render json: @neglected_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neglected_terms/1
  # DELETE /neglected_terms/1.json
  def destroy
    @neglected_term.destroy
    respond_to do |format|
      format.html { redirect_to neglected_terms_url, notice: 'Neglected term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neglected_term
      @neglected_term = NeglectedTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neglected_term_params
      params.require(:neglected_term).permit(:exclude)
    end
end
