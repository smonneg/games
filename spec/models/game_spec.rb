require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:ios_game1) { Game.create(platform: "ios", name: "Dark Soul") }
  let!(:ios_game2) { Game.create(platform: "ios", name: "Street Figther") }
  let!(:android_game) { Game.create(platform: "android", name: "Dark Knight") }

  describe ".search" do
    let(:search) { Game.search(platform, name) }
    let(:platform) { "" }
    let(:name) { "" }

    context "when there is no match" do
      let(:name) { "F-Zero" }

      it "returns nothing" do
        expect(search).to eq([])
      end
    end
    context "when no parameters passed" do
      it "returns all the game" do
        expect(search).to match_array(Game.all)
      end
    end

    context "when only the platform is passed" do
      let(:platform) { "ios" }

      it "returns the games on that platform" do
        expect(search).to match_array([ios_game1, ios_game2])
      end
    end

    context "when only the name is passed" do
      let(:name) { "Dark Knight" }

      it "returns the games matching that name" do
        expect(search).to match_array([android_game])
      end
    end

    context "when only a part of the name is passed" do
      let(:name) { "Soul" }

      it "returns the games partially matching that name" do
        expect(search).to match_array([ios_game1])
      end
    end

    context "when the platform and the name are passed" do
      let(:platform) { "ios" }
      let(:name) { "Figther" }

      it "returns the games matching the name on the given platform" do
        expect(search).to match_array([ios_game2])
      end
    end
  end
end
