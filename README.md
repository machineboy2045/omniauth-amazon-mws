# OmniAuth::Amazon Marketplace

Manage multiple seller accounts by allowing them to connect their accounts to your application. 

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-amazon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-amazon

## Prereqs

You must create an application via the [Amazon App Console](https://login.amazon.com/manageApps). Once that is complete, register two URLs under the <i>Web Settings</i>:

    http://localhost:3000/auth/amazon/callback
    http://your_website_here/auth/amazon/callback

## Usage

The merchant will be taken to a URL generated from the developer credentials you supply. After completing a short form, they will be returned to the callback address you specified in your developer account. You can retrieve their info from `request.env['omniauth.auth']` in your controller's callback action.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :amazon_mws, ENV['APP_ID'], ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_ACCESS_KEY']
end
```

## Configuration

Config options can be passed to `provider` via a `Hash`: