require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  let(:country) { FactoryGirl.create(:country) }
  # let(:symbol) - name of method
  # FactoryGirl.create(:symbol)

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the countries instance variable' do
      get :index
      expect(assigns(:countries)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'has countries in the instance variable' do
      3.times { |index| FactoryGirl.create(:country, name: "country#{index}") }
      get :index
      expect(assigns(:countries).length).to eq(3)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: country.id
      expect(response).to have_http_status(:success)
    end

    it "assigns @country instance variable" do
      get :show, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it 'renders show template' do
      get :show, id: country.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns country instance variable' do
      get :new
      expect(assigns(:country)).to_not eq(nil)
      expect(assigns(:country).class).to eq(Country)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: country.id
      expect(response).to have_http_status(:success)
    end

    it 'assigns country instance variable' do
      get :edit, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it 'renders edit template' do
      get :edit, id: country.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before(:each) do
      @country_params = {
        country: {
          language: 'English',
          population: 1000000,
          name: 'America2'
        }
      }
    end

    it 'sets country instance variable' do
      post :create, @country_params
      @country = assigns(:country)
      expect(@country).to_not eq(nil)
      expect(@country.name).to eq(@country_params[:country][:name])
    end

    it 'create new country' do
      expect(Country.count).to eq(0)
      post :create, @country_params
      expect(Country.count).to eq(1)
    end

    it 'has flash message' do
      post :create, @country_params
      expect(flash[:success]).to eq('Country Created!')
    end

    it 'redirects to country path on success' do
      post :create, @country_params
      expect(response).to redirect_to(country_path(Country.first.id))
    end

    it 'renders new template on fail' do
      post :create, { country: {name: 'Egypt'}}
      expect(response).to render_template(:new)
    end
  end

  describe 'PUT #update' do
    it 'sets country instance variable' do
      put :update, id: country.id, country: { name: 'Sweden' }
      expect(assigns(:country)).to eq(country)
      expect(country.reload.name).to eq('Sweden')
    end

    it 'sets flash message on success' do
      put :update, id: country.id, country: { name: 'Fuckoff' }
      expect(flash[:success]).to eq('Country Updated!')
    end

    it 'redirects to country path on success' do
      put :update, id: country.id, country: { name: 'Upyours'}
      expect(response).to redirect_to(country_path(country.id))
    end

    it 'renders edit on fail' do
      c = FactoryGirl.create(:country, name: 'Sweden')
      country
      put :update, id: c.id, country: { name: 'America' }
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'sets country instance variable' do
      delete :destroy, id: country.id
      expect(assigns(:country)).to eq(country)
    end

    it 'sets flash message on success' do
      delete :destroy, id: country.id
      expect(flash[:success]).to eq('Country Deleted!')
    end

    it 'redirects to countries path on success' do
      delete :destroy, id: country.id
      expect(response).to redirect_to(countries_path)
    end
  end
end