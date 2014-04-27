# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
#SampleApp::Application.config.secret_key_base = '2e10e01242bbe5ff7438dc97a8c4c1d08489b3032292509ff055c89b1799f4e0f93764a2c6687f8c3c65c5040c014ab1c01854f1208a64e0a29f70b7b1cb1ed6'
SampleApp::Application.config.secret_key_base = secure_token