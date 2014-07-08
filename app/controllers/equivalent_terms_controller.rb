class EquivalentTermsController < ApplicationController
  before_action :set_equivalent_term, only: [:show, :edit, :update, :destroy]

  # GET /equivalent_terms
  # GET /equivalent_terms.json
  def index
    @equivalent_terms = EquivalentTerm.all
  end

  # GET /equivalent_terms/1
  # GET /equivalent_terms/1.json
  def show
  end

  # GET /equivalent_terms/new
  def new
    @equivalent_term = EquivalentTerm.new
  end

  # GET /equivalent_terms/1/edit
  def edit
  end

  # POST /equivalent_terms
  # POST /equivalent_terms.json
  def create
    @equivalent_term = EquivalentTerm.new(equivalent_term_params)

    respond_to do |format|
      if @equivalent_term.save
        format.html { redirect_to @equivalent_term, notice: 'Equivalent term was successfully created.' }
        format.json { render :show, status: :created, location: @equivalent_term }
      else
        format.html { render :new }
        format.json { render json: @equivalent_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equivalent_terms/1
  # PATCH/PUT /equivalent_terms/1.json
  def update
    respond_to do |format|
      if @equivalent_term.update(equivalent_term_params)
        format.html { redirect_to @equivalent_term, notice: 'Equivalent term was successfully updated.' }
        format.json { render :show, status: :ok, location: @equivalent_term }
      else
        format.html { render :edit }
        format.json { render json: @equivalent_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equivalent_terms/1
  # DELETE /equivalent_terms/1.json
  def destroy
    @equivalent_term.destroy
    respond_to do |format|
      format.html { redirect_to equivalent_terms_url, notice: 'Equivalent term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equivalent_term
      @equivalent_term = EquivalentTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equivalent_term_params
      params.require(:equivalent_term).permit(:input, :output)
    end
end
