# frozen_string_literal: true

require "test_helper"

module Profiles
  class TracksControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = create(:user)
      @profile = create(:profile, user: @user)
      @track = create(:track, profile: @profile)
      sign_in(@user)
    end

    test "should get index" do
      get profile_tracks_path(@profile)
      assert_response :success
    end

    test "should get new" do
      get new_profile_track_path(@profile)

      assert_response :success
    end

    test "should create track" do
      assert_difference("Track.count", 1) do
        post profile_tracks_path(@profile), params: {
          track: { name: "New Track", description: "New description" }
        }
      end
      assert_redirected_to profile_track_path(@profile, Track.last)
    end

    test "should show track" do
      get profile_track_path(@profile, @track)
      assert_response :success
    end

    test "should get edit" do
      get edit_profile_track_path(@profile, @track)
      assert_response :success
    end

    test "should update track" do
      patch profile_track_path(@profile, @track), params: {
        track: { name: "Updated Track Name" }
      }
      assert_redirected_to profile_track_path(@profile, @track)
      @track.reload
      assert_equal "Updated Track Name", @track.name
    end
  end
end
