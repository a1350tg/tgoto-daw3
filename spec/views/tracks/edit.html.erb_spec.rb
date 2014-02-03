require 'spec_helper'

describe "tracks/edit" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :name => "MyString",
      :instrument => 1,
      :score => "MyText",
      :project => nil,
      :user => nil
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", track_path(@track), "post" do
      assert_select "input#track_name[name=?]", "track[name]"
      assert_select "input#track_instrument[name=?]", "track[instrument]"
      assert_select "textarea#track_score[name=?]", "track[score]"
      assert_select "input#track_project[name=?]", "track[project]"
      assert_select "input#track_user[name=?]", "track[user]"
    end
  end
end
