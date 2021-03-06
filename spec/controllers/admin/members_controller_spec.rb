require 'rails_helper'

RSpec.describe Admin::MembersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:members)).to eq([member])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_member as @admin_member" do
      member = Member.create! valid_attributes
      get :show, params: {id: member.to_param}, session: valid_session
      expect(assigns(:admin_member)).to eq(member)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_member as @admin_member" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin_member)).to be_a_new(Member)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_member as @admin_member" do
      member = Member.create! valid_attributes
      get :edit, params: {id: member.to_param}, session: valid_session
      expect(assigns(:admin_member)).to eq(member)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, params: {admin_member: valid_attributes}, session: valid_session
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created admin_member as @admin_member" do
        post :create, params: {admin_member: valid_attributes}, session: valid_session
        expect(assigns(:admin_member)).to be_a(Member)
        expect(assigns(:admin_member)).to be_persisted
      end

      it "redirects to the created admin_member" do
        post :create, params: {admin_member: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Member.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_member as @admin_member" do
        post :create, params: {admin_member: invalid_attributes}, session: valid_session
        expect(assigns(:admin_member)).to be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin_member: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_member" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, admin_member: new_attributes}, session: valid_session
        member.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_member as @admin_member" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, admin_member: valid_attributes}, session: valid_session
        expect(assigns(:admin_member)).to eq(member)
      end

      it "redirects to the admin_member" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, admin_member: valid_attributes}, session: valid_session
        expect(response).to redirect_to(member)
      end
    end

    context "with invalid params" do
      it "assigns the admin_member as @admin_member" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, admin_member: invalid_attributes}, session: valid_session
        expect(assigns(:admin_member)).to eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        put :update, params: {id: member.to_param, admin_member: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, params: {id: member.to_param}, session: valid_session
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, params: {id: member.to_param}, session: valid_session
      expect(response).to redirect_to(members_url)
    end
  end

end
