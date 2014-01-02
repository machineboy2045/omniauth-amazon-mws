# OmniAuth::Amazon Marketplace Web Services (MWS)

Manage inventory for multiple sellers by connecting their accounts to your application. 

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

The merchant will be taken to a URL generated from the developer credentials you supply. They will be asked if they want to allow your application access to their account. If they click "Yes", they will be returned to the callback address you specified in your developer account (refer to Prereqs). You can retrieve their info from `request.env['omniauth.auth']` in your Rails controller callback action. For more detailed information about how to setup your callback function, refer to the main OmniAuth repo.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :amazon_mws, ENV['APP_ID'], ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_ACCESS_KEY']
end
```
