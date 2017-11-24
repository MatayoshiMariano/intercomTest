require 'pry'
require_relative 'spec_helper'
require_relative '../user'

RSpec.describe User do

  describe '#initialize' do

    describe 'when all the keys are present' do

      let!(:params) {
        {
          "user_id" => 3, "name" => "Goku",
          "latitude" => 53.3393, "longitude" => -6.2576841
        }
      }
      let(:user) { User.new(params: params) }

      it 'wont raise an error' do
        expect { user }.not_to raise_error
      end

    end

    describe 'params without "user_id" key' do

      let!(:params) {
        { "name" => "Goku", "latitude" => 53.3393, "longitude" => -6.2576841 }
      }
      let(:user) { User.new(params: params) }

      it 'will raise an error' do
        expect { user }.to raise_error(KeyError)
      end

    end

    describe 'params without "name" key' do

      let!(:params) {
        { "user_id" => 2, "latitude" => 53.3393, "longitude" => -6.2576841 }
      }
      let(:user) { User.new(params: params) }

      it 'will raise an error' do
        expect { user }.to raise_error(KeyError)
      end

    end

    describe 'params without "latitude" key' do

      let!(:params) {
        { "user_id" => 2, "name" => "Goku", "longitude" => -6.2576841 }
      }
      let(:user) { User.new(params: params) }

      it 'will raise an error' do
        expect { user }.to raise_error(KeyError)
      end

    end

    describe 'params without "longitude" key' do

      let!(:params) {
        { "user_id" => 2, "name" => "Goku", "latitude" => -6.2576841 }
      }
      let(:user) { User.new(params: params) }

      it 'will raise an error' do
        expect { user }.to raise_error(KeyError)
      end

    end

  end

  describe '#invite_to?' do

    let!(:coordinates) { [53.3393, -6.2576841] }
    let!(:max_distance) { 1 }

    describe 'When inviting someone in the same place' do

      let!(:params) {
        {
          "user_id" => 3, "name" => "Goku",
          "latitude" => coordinates[0], "longitude" => coordinates[1]
        }
      }
      let!(:user) { User.new(params: params) }

      it 'will be invited' do
        invite = user.invite_to?(point: coordinates, max_distance: max_distance)
        expect(invite).to be true
      end

    end

    describe 'When inviting someone 1 km far from the place' do

      let!(:lock_6_cafe) { [53.330115, -6.261047] }
      let!(:params) {
        {
          "user_id" => 3, "name" => "Goku",
          "latitude" => lock_6_cafe[0], "longitude" => lock_6_cafe[1]
        }
      }
      let!(:user) { User.new(params: params) }

      it 'wont be invited' do
        invite = user.invite_to?(point: coordinates, max_distance: max_distance)
        expect(invite).to be false
      end

    end

  end

end
