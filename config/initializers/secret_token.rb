# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Blog::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || '98f98a63534c79fbd25c2c252735358db6fd25d4cb7de9fb47182ee0dfe553abadd818d63fcbb4f3c688b359062a4d0e605e8989fcfa3f09055c0506c676e26e'
