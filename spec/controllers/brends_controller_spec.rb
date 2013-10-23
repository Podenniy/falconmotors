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

describe BrendsController do

  # This should return the minimal set of attributes required to create a valid
  # Brend. As you add validations to Brend, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BrendsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all brends as @brends" do
      brend = Brend.create! valid_attributes
      get :index, {}, valid_session
      assigns(:brends).should eq([brend])
    end
  end

  describe "GET show" do
    it "assigns the requested brend as @brend" do
      brend = Brend.create! valid_attributes
      get :show, {:id => brend.to_param}, valid_session
      assigns(:brend).should eq(brend)
    end
  end

  describe "GET new" do
    it "assigns a new brend as @brend" do
      get :new, {}, valid_session
      assigns(:brend).should be_a_new(Brend)
    end
  end

  describe "GET edit" do
    it "assigns the requested brend as @brend" do
      brend = Brend.create! valid_attributes
      get :edit, {:id => brend.to_param}, valid_session
      assigns(:brend).should eq(brend)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Brend" do
        expect {
          post :create, {:brend => valid_attributes}, valid_session
        }.to change(Brend, :count).by(1)
      end

      it "assigns a newly created brend as @brend" do
        post :create, {:brend => valid_attributes}, valid_session
        assigns(:brend).should be_a(Brend)
        assigns(:brend).should be_persisted
      end

      it "redirects to the created brend" do
        post :create, {:brend => valid_attributes}, valid_session
        response.should redirect_to(Brend.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved brend as @brend" do
        # Trigger the behavior that occurs when invalid params are submitted
        Brend.any_instance.stub(:save).and_return(false)
        post :create, {:brend => { "title" => "invalid value" }}, valid_session
        assigns(:brend).should be_a_new(Brend)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Brend.any_instance.stub(:save).and_return(false)
        post :create, {:brend => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested brend" do
        brend = Brend.create! valid_attributes
        # Assuming there are no other brends in the database, this
        # specifies that the Brend created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Brend.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => brend.to_param, :brend => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested brend as @brend" do
        brend = Brend.create! valid_attributes
        put :update, {:id => brend.to_param, :brend => valid_attributes}, valid_session
        assigns(:brend).should eq(brend)
      end

      it "redirects to the brend" do
        brend = Brend.create! valid_attributes
        put :update, {:id => brend.to_param, :brend => valid_attributes}, valid_session
        response.should redirect_to(brend)
      end
    end

    describe "with invalid params" do
      it "assigns the brend as @brend" do
        brend = Brend.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Brend.any_instance.stub(:save).and_return(false)
        put :update, {:id => brend.to_param, :brend => { "title" => "invalid value" }}, valid_session
        assigns(:brend).should eq(brend)
      end

      it "re-renders the 'edit' template" do
        brend = Brend.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Brend.any_instance.stub(:save).and_return(false)
        put :update, {:id => brend.to_param, :brend => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested brend" do
      brend = Brend.create! valid_attributes
      expect {
        delete :destroy, {:id => brend.to_param}, valid_session
      }.to change(Brend, :count).by(-1)
    end

    it "redirects to the brends list" do
      brend = Brend.create! valid_attributes
      delete :destroy, {:id => brend.to_param}, valid_session
      response.should redirect_to(brends_url)
    end
  end

end