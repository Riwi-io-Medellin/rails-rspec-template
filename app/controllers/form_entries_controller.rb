class FormEntriesController < ApplicationController
  before_action :set_form_entry, only: %i[ show edit update destroy ]

  # GET /form_entries
  def index
    @form_entries = FormEntry.all
  end

  # GET /form_entries/1
  def show
  end

  # GET /form_entries/new
  def new
    @form_entry = FormEntry.new
  end

  # GET /form_entries/1/edit
  def edit
  end

  # POST /form_entries
  def create
    @form_entry = FormEntry.new(form_entry_params)

    if @form_entry.save
      redirect_to @form_entry, notice: "Form entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_entries/1
  def update
    if @form_entry.update(form_entry_params)
      redirect_to @form_entry, notice: "Form entry was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /form_entries/1
  def destroy
    @form_entry.destroy
    redirect_to form_entries_url, notice: "Form entry was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_entry
      @form_entry = FormEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_entry_params
      params.require(:form_entry).permit(:name, :age, :email, :phone, :birthdate, :notes)
    end
end
