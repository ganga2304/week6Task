require 'bcrypt'

# Sample user data
users = [
  { username: "mashrur", password: "password1" },
  { username: "jack", password: "password2" },
  { username: "arya", password: "password3" },
  { username: "jonshow", password: "password4" },
  { username: "heisenberg", password: "password5" }
]

# Method to create a hashed password
def create_hash_digest(password)
  BCrypt::Password.create(password)
end

# Method to verify a hashed password
def verify_hash_digest(hashed_password)
  BCrypt::Password.new(hashed_password)
end

# Method to create secure users by hashing their passwords
def create_secure_users(list_of_users)
  list_of_users.each do |user_record|
    user_record[:password] = create_hash_digest(user_record[:password])
  end
  list_of_users
end

# Method to authenticate a user
def authenticate_user(username, password, list_of_users)
  list_of_users.each do |user_record|
    if user_record[:username] == username
      # Verify the hashed password with the provided plain text password
      if verify_hash_digest(user_record[:password]) == password
        return "Authentication successful for user: #{username}"
      else
        return "Authentication failed for user: #{username}"
      end
    end
  end
  "User not found"
end

# Create secure users by hashing their passwords
secure_users = create_secure_users(users)

# Print secure users with hashed passwords
puts "Secure Users: "
secure_users.each { |user| puts user }

# Test authentication
puts authenticate_user("mashrur", "password1", secure_users)  # Should print "Authentication successful for user: mashrur"
puts authenticate_user("jack", "wrongpassword", secure_users) # Should print "Authentication failed for user: jack"
