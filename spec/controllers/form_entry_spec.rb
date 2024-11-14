require 'rails_helper'

RSpec.describe FormEntriesController, type: :controller do
    let(:valid_attributes) do
        { name: "El pepe", age: 30, email: "john@example.com", phone: "1234567890", birthdate: Date.today }
    end

    let(:invalid_attributes) do
        { name: "", age: -5, email: "invalidemail", phone: "123", birthdate: nil }
    end

    # get :index: Simula una solicitud HTTP GET a la acción index.
    # expect(response).to be_successful: Verifica que la respuesta sea exitosa (código de estado 200).
    describe "GET #index" do
        it "returns a successful response" do
            get :index
            expect(response).to be_successful
        end
    end

    # FormEntry.create! valid_attributes: Crea una nueva entrada de formulario con atributos válidos.
    # get :show, params: { id: form_entry.id }: Simula una solicitud GET a la acción show, pasando el ID del registro creado.
    describe "GET #show" do
        it "returns a successful response" do
            form_entry = FormEntry.create! valid_attributes
            get :show, params: { id: form_entry.id }
            expect(response).to be_successful
        end
    end

    # Verifica que la acción new devuelve una respuesta exitosa.
    describe "GET #new" do
        it "returns a successful response" do
            get :new
            expect(response).to be_successful
        end
    end

    # Similar a las anteriores, verifica la acción edit.
    describe "GET #edit" do
        it "returns a successful response" do
            form_entry = FormEntry.create! valid_attributes
            get :edit, params: { id: form_entry.id }
            expect(response).to be_successful
        end
    end

    describe "POST #create" do
        context "with valid parameters" do
            it "creates a new FormEntry and redirects to its show page" do
            expect {
                post :create, params: { form_entry: valid_attributes }
            }.to change(FormEntry, :count).by(1)

            expect(response).to redirect_to(FormEntry.last)
            expect(flash[:notice]).to eq("Form entry was successfully created.")
            end
    end
    # expect { post :create, params: { form_entry: valid_attributes } }.to change(FormEntry, :count).by(1): Verifica que al crear un nuevo registro, el conteo de entradas de formulario aumenta en uno.
    # expect(response).to redirect_to(FormEntry.last): Verifica que se redirige a la página del último registro creado.
    # expect(flash[:notice]).to eq("Form entry was successfully created."): Verifica que se muestre un mensaje flash indicando que la creación fue exitosa.


    context "with invalid parameters" do
        it "does not create a new FormEntry and renders the new template" do
        expect {
            post :create, params: { form_entry: invalid_attributes }
        }.not_to change(FormEntry, :count)

        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
        end
    end
    #  .not_to change(FormEntry, :count): Verifica que no se crea ninguna nueva entrada de formulario.
    # .render_template(:new): Verifica que se renderiza la plantilla new.
    # .to eq(422): Verifica que el código de estado de respuesta sea 422 (Unprocessable Entity).
    end

    describe "PATCH #update" do
    let(:form_entry) { FormEntry.create! valid_attributes }

    context "with valid parameters" do
        let(:new_attributes) do
        { name: "Updated name" }
        end

        it "updates the requested form_entry and redirects to the show page" do
        patch :update, params: { id: form_entry.id, form_entry: new_attributes }
        form_entry.reload
        expect(form_entry.name).to eq("Updated name")
        expect(response).to redirect_to(form_entry)
        expect(flash[:notice]).to eq("Form entry was successfully updated.")
        end
    end

    # Form_entry.reload: Recarga el objeto desde la base de datos para obtener los valores actualizados.
    # Las expectativas verifican si el nombre ha sido actualizado y si se redirige correctamente.

    context "with invalid parameters" do
        it "does not update the form_entry and renders the edit template" do
        patch :update, params: { id: form_entry.id, form_entry: invalid_attributes }
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422)
        end
    end
    # Verifica que no se actualice el registro y se renderice la plantilla de edición.
    end

    describe "DELETE #destroy" do
    it "destroys the requested form_entry and redirects to the index page" do
        form_entry = FormEntry.create! valid_attributes
        expect {
        delete :destroy, params: { id: form_entry.id }
        }.to change(FormEntry, :count).by(-1)

        expect(response).to redirect_to(form_entries_url)
        expect(flash[:notice]).to eq("Form entry was successfully destroyed.")
    end
    # Verifica que al eliminar un registro, el conteo disminuye en uno y se redirige correctamente a la página de índice.
end
end
