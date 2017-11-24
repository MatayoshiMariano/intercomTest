require_relative './invitation'

FILE_NAME = "customers.json"
FILE_PATH = File.join(File.dirname(__FILE__), FILE_NAME)
HQ_COORDINATES = [53.3393, -6.2576841]
MIN_DISTANCE = 100

Invitation.new(file_path: FILE_PATH, coordinates: HQ_COORDINATES, max_distance: MIN_DISTANCE).print_users_to_invite
