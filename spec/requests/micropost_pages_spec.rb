require 'spec_helper'

describe "MicropostPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { first(:button, "Post").click }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { first(:button, "Post").click }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in('micropost_content', with: "Lorem ipsum", :match => :first) }
      it "should create a micropost" do
        expect { first(:button, "Post").click }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    it { should_not have_link('delete') }

    describe "as correct user" do
      before { visit root_path }

      it { should have_link('delete') }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
