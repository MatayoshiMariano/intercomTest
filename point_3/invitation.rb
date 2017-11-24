require_relative './user'
require 'json'

class Invitation

  attr_reader :file_path, :coordinates, :max_distance

  def initialize(file_path:, coordinates:, max_distance:)
    @file_path, @coordinates, @max_distance = file_path, coordinates, max_distance
  end

  def print_users_to_invite
    users_to_invite.each do |user|
      puts "#{user.id}: #{user.name}"
    end
  end

  private

  def users_to_invite
    @users_to_invite ||= users.select do |user|
      user.invite_to?(point: coordinates, max_distance: max_distance)
    end.sort_by(&:id)
  end

  def users
    @users ||= file.each_line.map do |line|
      params = JSON.parse(line)
      User.new(params: params)
    end
  end

  def file
    @file ||= File.open(file_path).read
  end

end
