require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VinCodsController do

  # This should return the minimal set of attributes required to create a valid
  # VinCod. As you add validations to VinCod, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "brend_avto" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VinCodsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vin_cods as @vin_cods" do
      vin_cod = VinCod.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vin_cods).should eq([vin_cod])
    end
  end

  describe "GET show" do
    it "assigns the requested vin_cod as @vin_cod" do
      vin_cod = VinCod.create! valid_attributes
      get :show, {:id => vin_cod.to_param}, valid_session
      assigns(:vin_cod).should eq(vin_cod)
    end
  end

  describe "GET new" do
    it "assigns a new vin_cod as @vin_cod" do
      get :new, {}, valid_session
      assigns(:vin_cod).should be_a_new(VinCod)
    end
  end

  describe "GET edit" do
    it "assigns the requested vin_cod as @vin_cod" do
      vin_cod = VinCod.create! valid_attributes
      get :edit, {:id => vin_cod.to_param}, valid_session
      assigns(:vin_cod).should eq(vin_cod)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VinCod" do
        expect {
          post :create, {:vin_cod => valid_attributes}, valid_session
        }.to change(VinCod, :count).by(1)
      end

      it "assigns a newly created vin_cod as @vin_cod" do
        post :create, {:vin_cod => valid_attributes}, valid_session
        assigns(:vin_cod).should be_a(VinCod)
        assigns(:vin_cod).should be_persisted
      end

      it "redirects to the created vin_cod" do
        post :create, {:vin_cod => valid_attributes}, valid_session
        response.should redirect_to(VinCod.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vin_cod as @vin_cod" do
        # Trigger the behavior that occurs when invalid params are submitted
        VinCod.any_instance.stub(:save).and_return(false)
        post :create, {:vin_cod => { "brend_avto" => "invalid value" }}, valid_session
        assigns(:vin_cod).should be_a_new(VinCod)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VinCod.any_instance.stub(:save).and_return(false)
        post :create, {:vin_cod => { "brend_avto" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vin_cod" do
        vin_cod = VinCod.create! valid_attributes
        # Assuming there are no other vin_cods in the database, this
        # specifies that the VinCod created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VinCod.any_instance.should_receive(:update).with({ "brend_avto" => "MyString" })
        put :update, {:id => vin_cod.to_param, :vin_cod => { "brend_avto" => "MyString" }}, valid_session
      end

      it "assigns the requested vin_cod as @vin_cod" do
        vin_cod = VinCod.create! valid_attributes
        put :update, {:id => vin_cod.to_param, :vin_cod => valid_attributes}, valid_session
        assigns(:vin_cod).should eq(vin_cod)
      end

      it "redirects to the vin_cod" do
        vin_cod = VinCod.create! valid_attributes
        put :update, {:id => vin_cod.to_param, :vin_cod => valid_attributes}, valid_session
        response.should redirect_to(vin_cod)
      end
    end

    describe "with invalid params" do
      it "assigns the vin_cod as @vin_cod" do
        vin_cod = VinCod.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VinCod.any_instance.stub(:save).and_return(false)
        put :update, {:id => vin_cod.to_param, :vin_cod => { "brend_avto" => "invalid value" }}, valid_session
        assigns(:vin_cod).should eq(vin_cod)
      end

      it "re-renders the 'edit' template" do
        vin_cod = VinCod.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VinCod.any_instance.stub(:save).and_return(false)
        put :update, {:id => vin_cod.to_param, :vin_cod => { "brend_avto" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vin_cod" do
      vin_cod = VinCod.create! valid_attributes
      expect {
        delete :destroy, {:id => vin_cod.to_param}, valid_session
      }.to change(VinCod, :count).by(-1)
    end

    it "redirects to the vin_cods list" do
      vin_cod = VinCod.create! valid_attributes
      delete :destroy, {:id => vin_cod.to_param}, valid_session
      response.should redirect_to(vin_cods_url)
    end
  end

end
